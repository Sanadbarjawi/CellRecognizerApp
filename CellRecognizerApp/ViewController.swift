//
//  ViewController.swift
//  CellRecognizerApp
//
//  Created by Sanad Barjawi on 9/2/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit

struct Post: Decodable {
    var message: String?
    var image: String?
}
class ViewController: UIViewController {
    
    
    ///JSON Data
    // Dictionary containing data as provided in your question.
    var postArray : [Post] = [Post(message: "Hi", image: "www.youtube,.com")]
    
    //MARK: - Outlets
    @IBOutlet weak var tableViewTest: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewTest.register(UINib(nibName: "\(MessageOnlyCell.self)", bundle: nil), forCellReuseIdentifier: "\(MessageOnlyCell.self)")
        tableViewTest.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))// creating 0 size UIVIEW and assigning it to be the tableview footer(to eliminate the extra row seperaters)
        
    }
    
    //the configureTableHeight func is to configure the tableview height to make it dynamic based on its content size(not to forget to set the height constraint priority to 999 and letting it >=)
    func configureTableHeight(){
        let height = tableViewTest.contentSize.height
        tableViewHeightConstraint.constant = height
        self.view.layoutIfNeeded()
    }
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(MessageOnlyCell.self)", for: indexPath) as? Cellable & UITableViewCell else { return  UITableViewCell() }
        cell.configure(modelData: postArray, row: indexPath.row)
        configureTableHeight()
        return cell
    }
}
