//
//  ViewController.swift
//  SampleChat UI
//
//  Created by Prashant Dwivedi on 07/05/19.
//  Copyright © 2019 Prashant Dwivedi. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(MessageCell.self, forCellReuseIdentifier: cellId)
    }
    
    
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//        cell.textLabel?.text = "Could not load IOSurface for time string. Rendering locally instead. Could not load IOSurface for time string. Rendering locally instead. Could not load IOSurface for time string. Rendering locally instead"
//        cell.textLabel?.numberOfLines = 0
        tableView.separatorStyle = .none
        return cell
    }
}

