//
//  ViewController.swift
//  SampleChat UI
//
//  Created by Prashant Dwivedi on 07/05/19.
//  Copyright © 2019 Prashant Dwivedi. All rights reserved.
//

import UIKit

struct ChatMessage {
    let text : String
    let isIncoming : Bool
    
}

class ViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    
    let chatMessage = [
        ChatMessage(text: "My first stream is going to be tomorrow! Please suggest algorithms, tiny code projects, or code repos to read using the Suggestion Box on my Twitch page:", isIncoming: true),
        ChatMessage(text: "Greetings from Mysore", isIncoming: false),
        ChatMessage(text: "This sticker goes out to all the tech recruiters who still don’t get it.", isIncoming: true),
        ChatMessage(text: "Big Bang Theory is over? THANK GOD. What a flaming pile of garbage. Science isn’t for “nerds”. Taking care of yourself, your appearance, and personal hygiene isn’t for “dumb people”.", isIncoming: false),
        ChatMessage(text: "\"The most fascinating thing about these exit poll...\": Here's what Harsha Bhogle makes of Exit poll predictions for the 2019 Lok Sabha elections", isIncoming: true)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTableView()
    }
    
    func setupTableView () {
        tableView.register(MessageCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .init(white: 0.95, alpha: 1)
        tableView.separatorStyle = .none
    }
    
    
}

extension ViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessage.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section : \(section)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessageCell
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        let messageInfo = chatMessage[indexPath.row]
        cell.chatMessage = messageInfo
        return cell
    }
}

