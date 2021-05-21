//
//  ViewController.swift
//  BitsoChallenge
//
//  Created by Juan carlos De la parra on 06/05/21.
//

import UIKit

class ViewController: UICollectionViewController {
    
    func didUpdateCollectionView(_ bookModel: BooksViewModel, message: [BookPrice?]) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
                                }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookPrices.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath as IndexPath) as! BookCollectionViewCell
       
        let cellData = bookPrices[indexPath.row]
        cell.configure(with: BooksViewModel(with: cellData))
       
        return cell
    }
  
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "ShowDetail", sender: self)
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         print(segue.destination)
         if let destination = segue.destination as? BookDetailViewController {
        
            destination.bookPriceInfo = self.bookPrices[self.selectedIndex]
             print(destination.bookPriceInfo as Any)
         }
     }
     
    func configureDelegates(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func configureSpacing(){
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.collectionViewLayout = layout
    }
     
    let reuseIdentifier = "BookCollectionViewCell"
    var booksArray = [String]()
    var booksNames = [String]()
    var pricesArray = [String]()
    var bookPrices = [BookPrice]()
    var viewmodel: BooksViewModel?
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let serialQueue = DispatchQueue.global().sync()

        configureDelegates()
        configureSpacing()
        fetchData()
    }
    
    func fetchData(){
        
        DispatchQueue.global().sync(flags: .barrier) {
            NetworkManager.shared.fetchBooks() {[weak self] (res) in
                guard let self = self else { return }
                
                switch res {
                case .failure(let error):
                    print(error)
                case .success(let books):
                    for book in books.payload {
                        self.booksArray.append((book?.book)!)
                    }
                    print(self.booksArray)
                    DispatchQueue.global().sync() {
                        NetworkManager.shared.fetchPrice() {[weak self] (res) in
                            guard let self = self else { return }
                            switch res {
                            case .failure(let error):
                                print(error)
                            case .success(let books):
                                for book in books.payload {
                                    if self.booksArray.contains((book?.book!)!) { // checking for book´s availability
                                        self.bookPrices.append(book!)
                                    }
                                    
                                }
                                DispatchQueue.main.async {
                                   self.collectionView.reloadData()
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    
    }
}

