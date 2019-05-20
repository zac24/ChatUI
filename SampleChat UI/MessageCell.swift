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
    
    var leadingConstraint : NSLayoutConstraint!
    var trailingContraint : NSLayoutConstraint!
    
    var chatMessage : ChatMessage!{
        didSet{
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingContraint.isActive = false
            }else {
                leadingConstraint.isActive = false
                trailingContraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:.default, reuseIdentifier: reuseIdentifier)
        
        messageLabel.numberOfLines = 0
        bubbleBackgroundView.backgroundColor = UIColor.gray
        bubbleBackgroundView.layer.cornerRadius = 12.0
        
        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)
    
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let constraints = [bubbleBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                           bubbleBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                           bubbleBackgroundView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                           
                           messageLabel.topAnchor.constraint(equalTo: bubbleBackgroundView.topAnchor, constant: 16),
                           messageLabel.leftAnchor.constraint(equalTo: bubbleBackgroundView.leftAnchor, constant: 16),
                           messageLabel.bottomAnchor.constraint(equalTo: bubbleBackgroundView.bottomAnchor, constant: -16),
                           messageLabel.rightAnchor.constraint(equalTo: bubbleBackgroundView.rightAnchor, constant: -16)]
        
        NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = bubbleBackgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16)
        leadingConstraint.isActive = true
        trailingContraint = bubbleBackgroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        trailingContraint.isActive = false
        
        
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
