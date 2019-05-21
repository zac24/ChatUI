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
    let date : Date
    
}

class ViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    
    let chatMessage = [
        [
            ChatMessage(text: "My first stream is going to be tomorrow! Please suggest algorithms, tiny code projects, or code repos to read using the Suggestion Box on my Twitch page:", isIncoming: true, date: Date.dateFromCustomString(customString: "20/05/2019")),
            ChatMessage(text: "Greetings from Mysore", isIncoming: false, date: Date.dateFromCustomString(customString: "20/05/2019"))
        ],
        [
            ChatMessage(text: "This sticker goes out to all the tech recruiters who still don’t get it.", isIncoming: true, date: Date.dateFromCustomString(customString: "22/05/2019")),
            ChatMessage(text: "Big Bang Theory is over? THANK GOD. What a flaming pile of garbage. Science isn’t for “nerds”. Taking care of yourself, your appearance, and personal hygiene isn’t for “dumb people”.", isIncoming: false, date: Date.dateFromCustomString(customString: "22/05/2019")),
            ChatMessage(text: "\"The most fascinating thing about these exit poll...\": Here's what Harsha Bhogle makes of Exit poll predictions for the 2019 Lok Sabha elections", isIncoming: true, date: Date.dateFromCustomString(customString: "22/05/2019"))
        ],
        [
            ChatMessage(text: "My first stream is going to be tomorrow! Please suggest algorithms, tiny code projects, or code repos to read using the Suggestion Box on my Twitch page:", isIncoming: true, date: Date.dateFromCustomString(customString: "24/05/2019")),
            ChatMessage(text: "Greetings from Mysore", isIncoming: false, date: Date.dateFromCustomString(customString: "24/05/2019"))
        ],
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
        return chatMessage.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessage[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if let firstObjectOfSection = chatMessage[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "DD/MM/YYYY"
            let dateString = dateFormatter.string(from: firstObjectOfSection.date)
            return dateString
        }
        
        return ""
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessageCell
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        let messageInfo = chatMessage[indexPath.section][indexPath.row]
        cell.chatMessage = messageInfo
        return cell
    }
}

extension Date {
    static func dateFromCustomString(customString:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "DD/MM/YYYY"
        return dateFormatter.date(from: customString) ?? Date()
    }
}

