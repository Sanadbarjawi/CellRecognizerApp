//
//  MessageOnlyCell.swift
//  CellRecognizerApp
//
//  Created by Sanad Barjawi on 9/2/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit

protocol Cellable: class{
    func configure(modelData: [Post]?, row:Int)
}
class MessageOnlyCell: UITableViewCell, Cellable {
    weak var delegate: Cellable?
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
    
    func configure(modelData: [Post]?, row:Int) {
        guard let data = modelData else { return }
        self.textLbl.text = data[row].message
    }
    
}
