//
//  BookDetailViewController.swift
//  BitsoChallenge
//
//  Created by Pinakin Purohit on 07/05/2021.
//


import UIKit

class BookDetailViewController: UIViewController {
    @IBOutlet weak var bidLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var askLabel: UILabel!
    @IBOutlet weak var spreadLabel: UILabel!
    @IBOutlet weak var backview: UIView!
    
    var bookPriceInfo:BookPrice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bidLabel.text = bookPriceInfo?.bid
        lowLabel.text = bookPriceInfo?.low
        highLabel.text = bookPriceInfo?.high
        volumeLabel.text = bookPriceInfo?.volume
        askLabel.text = bookPriceInfo?.ask
        spreadLabel.text = bookPriceInfo?.vwap

    }
}

