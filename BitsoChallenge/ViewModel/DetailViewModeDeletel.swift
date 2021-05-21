//
//  DetailViewModel.swift
//  BitsoChallenge
//
//  Created by Pinakin Purohit on 11/05/2021.
//

import Foundation


class DetailViewModel {
    //var delegate: didUpdate?
     
     var price: String?
     var book: String?
     
     var bid: String?
     var ask: String?
     var low: String?
     var high: String?
     var volume: String?
     var spread: String?
    
    init(with model:BookPrice){
        price = format(price: model.last!)
    }
    
    func format(price: String) -> String {
        
        let double = Double(price)
        let price = String(format: "$%.02f", double!)
        return price
    }
    
    
}
 
