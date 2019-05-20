//
//  MessageCell.swift
//  SampleChat UI
//
//  Created by Prashant Dwivedi on 07/05/19.
//  Copyright © 2019 Prashant Dwivedi. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    var messageLabel = UILabel()
    var bubbleBackgroundView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:.default, reuseIdentifier: reuseIdentifier)
        
        messageLabel.text = "Could not load IOSurface for time string. Rendering locally instead. Could not load IOSurface for time string. Rendering locally instead. Could not load IOSurface for time string. Rendering locally instead"
        messageLabel.numberOfLines = 0
//        messageLabel.textAlignment = .justified
        bubbleBackgroundView.backgroundColor = UIColor.gray
        bubbleBackgroundView.layer.cornerRadius = 8.0
        
        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundViewConstraint = [bubbleBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                                        bubbleBackgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
                                        bubbleBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                                        bubbleBackgroundView.widthAnchor.constraint(equalToConstant: 250)]
        
        
        let constraints = [messageLabel.topAnchor.constraint(equalTo: bubbleBackgroundView.topAnchor, constant: 16),
        messageLabel.leftAnchor.constraint(equalTo: bubbleBackgroundView.leftAnchor, constant: 16),
        messageLabel.bottomAnchor.constraint(equalTo: bubbleBackgroundView.bottomAnchor, constant: -16),
        messageLabel.rightAnchor.constraint(equalTo: bubbleBackgroundView.rightAnchor, constant: -16)]
        
        
        NSLayoutConstraint.activate(backgroundViewConstraint)
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
