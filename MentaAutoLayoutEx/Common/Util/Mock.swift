//
//  Mock.swift
//  MentaAutoLayoutEx
//
//  Created by 山田隼也 on 2020/08/17.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation

struct Mock {
    
    struct User {
        let name: String?
        let descriptionText: String?
    }
    
    static let users: [User] = [
        User(name: "Thomas Edison", descriptionText: "The best thinking has been done in solitude. The worst has been done in turmoil."),
        User(name: "Steve Jobs", descriptionText: "Details matter, it’s worth waiting to get it right."),
        User(name: "Albert Einstein", descriptionText: "Try not to become a man of success, but rather try to become a man of value."),
        User(name: "Napoleon", descriptionText: "A true man hates no one."),
        User(name: "John Lennon", descriptionText: "Love is like a flower – you’ve got to let it grow."),
        User(name: "James Dean", descriptionText: "Dream as if you’ll live forever. Live as if you’ll die today."),
        User(name: "Jean Jacques Rousseau", descriptionText: "Take the course opposite to custom and you will almost always do well.")
    ]
}
