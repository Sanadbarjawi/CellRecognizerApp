//
//  MessageAndImageCell.swift
//  CellRecognizerApp
//
//  Created by Sanad Barjawi on 9/2/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit

class MessageAndImageCell: UITableViewCell, Cellable{
    weak var delegate: Cellable?

    @IBOutlet weak var Lbl: UILabel!
    @IBOutlet weak var imageVw: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
    
    func configure(modelData: [Post]?, row:Int) {
        guard let data = modelData else { return }
        Lbl.text = data[row].message
        print("image found")
    }
    
}
