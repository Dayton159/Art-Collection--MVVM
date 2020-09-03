//
//  DetailTableViewController.swift
//  Art Collection -MVC
//
//  Created by Dayton on 03/09/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var artSelected = [ArtObject]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
        
    }

    func setupTable(){
        title = artSelected[0].getCreator
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artSelected.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell
        
        let object = artSelected[indexPath.row]
        
        cell.detailViewModel = object
        cell.selectionStyle = .none
        return cell
    }
    
//MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? DetailTableViewCell else {
          return
        }
        let object = artSelected[indexPath.row]
        object.isExpanded = !object.isExpanded
        
        artSelected[indexPath.row] = object
        
        cell.moreInfoTextView.text = object.expandedTable
        cell.moreInfoTextView.textAlignment = object.isExpanded ? .left : .center
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        if artSelected[indexPath.row].isExpanded{
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }else{
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
        
        
    }

}
