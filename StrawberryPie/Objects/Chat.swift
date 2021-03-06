//
//  Chat.swift
//  StrawberryPie
//
//  Created by iosdev on 22/11/2019.
//  Copyright © 2019 Team Työkkäri. All rights reserved.
//
// This class is used for defining a Chat object to be used with Realm

import Foundation
import RealmSwift

@objcMembers class Chat: Object {
    dynamic var chatID: String = UUID().uuidString
    dynamic var title: String = ""
    let userList = List<User>()
    let chatMessages = List<ChatMessage>()
    override static func primaryKey() -> String? {
        return "chatID"
    }
}
