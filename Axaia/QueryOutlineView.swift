//
//  QueryOutlineView.swift
//  Axaia
//
//  Created by Mikołaj Wielocha on 19/01/15.
//  Copyright (c) 2015 Mikołaj Wielocha. All rights reserved.
//

import Cocoa

class QueryOutineView: NSObject, NSOutlineViewDataSource {
    
    var rows: Array<Entity>
    
    override init()
    {
        self.rows = Array<Entity>()
        self.rows.append(Entity(key: "123", value: "value"))
    }
    
    func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: Entity?) -> Entity {
        if let entity = item {
            return entity.children[index] as Entity
        } else {
            return self.rows[index]
        }
    }
    
    func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: Entity?) -> Int {
        if let entity = item {
            return entity.children.count
        } else {
            return self.rows.count
        }
    }
    
    func outlineView(outlineView: NSOutlineView, isItemExpandable item: Entity?) -> Bool {
        if let entity = item {
            return entity.children.count > 0
        } else {
            return false
        }
    }
    
    func outlineView(outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn!, byItem item: Entity!) -> AnyObject? {
        
        if(tableColumn.identifier == "key") {
            return item.key()
        } else if(tableColumn!.identifier == "value") {
            return item.value();
        } else {
            return "Ups"
        }
    }
}
