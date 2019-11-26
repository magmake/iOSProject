//
//  QASession.swift
//  StrawberryPie
//
//  Created by iosdev on 21/11/2019.
//  Copyright © 2019 Team Työkkäri. All rights reserved.
//

import Foundation
    
import RealmSwift
import Foundation

@objcMembers class Feed: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var picture: String? = ""
    
    //override static func primaryKey() -> String? {}
}
