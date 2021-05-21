//
//  BookViewController.swift
//  BitsoChallenge
//
//  Created by Pinakin Purohit on 07/05/2021.
//
/*

import UIKit

class BookViewController: UICollectionViewController {
    
    var booksArray = [String]()
    var pricesArray = [String]()
    var bookPrices = [String:String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let serialQueue = DispatchQueue.global().sync()
        
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
                                    //print(book?.last as Any)
                                    //print(book?.book as Any)
                                    
                                    self.bookPrices[(book?.book)!] =   book?.last
                                }
                                print(self.bookPrices)
                            }
                        }
                    }
                }
            }
        }
    }
}
*/
