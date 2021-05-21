//
//  BookViewModel.swift
//  BitsoChallenge
//
//  Created by Pinakin Purohit on 10/05/2021.
//

import Foundation


class BooksViewModel {
    
    //var delegate: didUpdate?
    var messages = [Book]()
    
    var name: String?
    var price: String?
    
    let reuseIdentifier = "BookCollectionViewCell"
    var booksArray = [String]()
    var booksNames = [String]()
    var pricesArray = [String]()
    var bookPrices = [String:String]()
    
    init(with model:BookPrice){
        name = model.book
        price = format(price: model.last!)
    }
    
    func format(price: String) -> String {
        
        let double = Double(price)
        let price = String(format: "$%.02f", double!)
        return price
    }
    
}

