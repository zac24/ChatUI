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
    fileprivate let textMessage = [
    "My first stream is going to be tomorrow! Please suggest algorithms, tiny code projects, or code repos to read using the Suggestion Box on my Twitch page:",
    "Greetings from Mysore",
    "This sticker goes out to all the tech recruiters who still don’t get it.",
    "Big Bang Theory is over? THANK GOD. What a flaming pile of garbage. Science isn’t for “nerds”. Taking care of yourself, your appearance, and personal hygiene isn’t for “dumb people”.",
    "\"The most fascinating thing about these exit poll...\": Here's what Harsha Bhogle makes of Exit poll predictions for the 2019 Lok Sabha elections"
    ]
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
        return textMessage.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessageCell
        cell.messageLabel.text = textMessage[indexPath.row]
        
        tableView.separatorStyle = .none
        return cell
    }
}

