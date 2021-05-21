//
//  BookCollectionViewCell.swift
//  BitsoChallenge
//
//  Created by Pinakin Purohit on 07/05/2021.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookPriceLabel: UILabel!
    @IBOutlet weak var bookNameLabel: UILabel!
    
    var viewModel:BooksViewModel?
    
    func configure(with viewModel:BooksViewModel){
        
        self.viewModel = viewModel
        bookNameLabel.text = viewModel.name
        bookPriceLabel.text = viewModel.price
    }
    
}

