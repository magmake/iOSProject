//
//  PrivateChatCell.swift
//  StrawberryPie
//
//  Created by iosdev on 09/12/2019.
//  Copyright © 2019 Team Työkkäri. All rights reserved.
//
// Reusable cell for private message cells. Has a .xib file for styling.


import UIKit

class PrivateChatCell: UITableViewCell {
    @IBOutlet weak var chatPartner: UILabel!
    @IBOutlet weak var lastUser: UILabel!
    @IBOutlet weak var lastTimestamp: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
}
