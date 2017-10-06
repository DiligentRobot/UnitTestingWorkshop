//
//  DataSource.swift
//  ViewModelExample
//
//  Created by Scotty on 06/10/2017.
//  Copyright © 2017 Diligent Robot. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
    let people: [Person]
    
    init(people: [Person]) {
        self.people = people
    }
}

extension DataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a tableview cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellView", for: indexPath) as! CellView
        cell.model = ViewModel(person: people[indexPath.row], index: indexPath.row)
        return cell
    }
}
