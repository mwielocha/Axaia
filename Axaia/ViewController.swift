//
//  ViewController.swift
//  Axaia
//
//  Created by Mikołaj Wielocha on 18/01/15.
//  Copyright (c) 2015 Mikołaj Wielocha. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var queryView: NSTextView!
    
    var cassandra: Cassandra!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cassandra = CassObjc()
        cassandra.connect("127.0.0.1")

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func run(sender : AnyObject) {
        cassandra.query(queryView.string)
    }
}

