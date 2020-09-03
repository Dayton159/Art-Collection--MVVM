//
//  MasterTableViewController.swift
//  Art Collection -MVC
//
//  Created by Dayton on 01/09/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    var firstValue:Observable<Int> = Observable(0)
    var secondValue:Observable<Int> = Observable(4)
    var firstFetched:Observable<Bool> = Observable(true)
    var picture = [ArtObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
        setupTableView()
        
        Service.shared.delegate = self
        fetchAndBind()
    }
    
    func fetchAndBind(){
        Service.shared.fetchCourse()
        //fetchData()
        
        firstValue.bind {
            Service.shared.currentIndexObject = $0
        }
        
        secondValue.bind {
            Service.shared.upcomingObjectRefreshed = $0
        }
        
        firstFetched.bind {
            Service.shared.isFirstFetch = $0
        }
    }
    
    private func setupTableView(){
        //tableView.register(MasterTableViewCell.nib(), forCellReuseIdentifier: MasterTableViewCell.cellIdentifier)
        tableView.rowHeight = 300
        tableView.estimatedRowHeight = 240
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return picture.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MasterTableViewCell
        let object = picture[indexPath.row]
        cell.viewModel = object
        
        return cell
        
    }
   
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // need to pass your indexpath then it showing your indicator at bottom
        tableView.addLoading(indexPath) {
            // add your code here
            // append Your array and reload your tableview
            self.firstValue.value = indexPath.row + 1
            self.secondValue.value += 3
            Service.shared.fetchMoreObject()
            print("1")
            
            tableView.stopLoading() // stop your indicator
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             performSegue(withIdentifier: "goToDetail", sender: self)
            
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let destinationVC = segue.destination as! DetailTableViewController
            
            
            if let indexPath = tableView.indexPathForSelectedRow{
                destinationVC.artSelected.append(picture[indexPath.row])
            }
            
        }
    }
    
    
}

extension MasterTableViewController:FetchingDelegate {
    func addData(_ object: [ArtObject]) {
        picture.append(contentsOf: object)
        firstFetched.value = false
        tableView.reloadData()
    }
}
