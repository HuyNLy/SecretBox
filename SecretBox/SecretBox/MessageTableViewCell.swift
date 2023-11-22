//
//  MessageTableViewCell.swift
//  SecretBox
//
//  Created by Huy Ly on 11/21/23.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var msgBackgroundview: UIView!
    @IBOutlet weak var msglabel: UILabel!
    var trailingContraint: NSLayoutConstraint!
    var leadingContraint: NSLayoutConstraint!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        msglabel.text = nil
        leadingContraint.isActive = false
        trailingContraint.isActive = false
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func updateMsgCell(by message: MsgData)
    {
        msgBackgroundview.layer.cornerRadius = 16
        msgBackgroundview.clipsToBounds = true
        trailingContraint = msgBackgroundview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20 )
        leadingContraint = msgBackgroundview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20 )
        msglabel.text = message.text
        
        if message.isFirstUser
        {
            msgBackgroundview.backgroundColor = UIColor(red: 53/255, green: 150/255, blue: 255/255, alpha: 1)
            trailingContraint.isActive = true
            msglabel.textAlignment = .right
           
        }
        else
        {
            msgBackgroundview.backgroundColor = UIColor(red: 80/255, green: 170/255, blue: 93/255, alpha: 1)
            leadingContraint.isActive = true
            msglabel.textAlignment = .left
        }
    }
}
