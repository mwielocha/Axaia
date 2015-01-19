//
//  Person.swift
//  Axaia
//
//  Created by Mikołaj Wielocha on 19/01/15.
//  Copyright (c) 2015 Mikołaj Wielocha. All rights reserved.
//

import Foundation

class Person: NSObject {

    var name: String!
    
    var children: Array<Person>
    
    init(name: String)
    {
        self.name = name
        self.children = Array()
    }
    
    func addChild(person: Person) {
        self.children.append(person)
    }
}
