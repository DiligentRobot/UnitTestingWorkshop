//
//  ViewController.swift
//  ViewModelExample
//
//  Created by Scotty on 03/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stateController: StateController!
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Documents Folder.
        let documentsDirectoryURL = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
        
        // Build a full path for the plist we are going to read from/ save to
        let peopleFileURL: URL = documentsDirectoryURL
                .appendingPathComponent("People")
                .appendingPathExtension("plist")
    
        stateController = StateController(storage: StorageController(peopleFileURL: peopleFileURL))
        dataSource = DataSource(people: stateController.people)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}
