//
//  User.swift
//  Project
//
//  Created by Catherine on 9/19/15.
//  Copyright © 2015 Catherine McMahon. All rights reserved.
//

import Foundation

struct User {
    
    var firstName: String?
    var lastName: String?
    var organization: String?
    var email: String?
    var url: String?
    var desc: String?
    
    init(firstName: String?, lastName: String?, organization: String?, email: String?, url: String?, desc: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.organization = organization
        self.email = email
        self.url = url
        self.desc = desc
    }
}