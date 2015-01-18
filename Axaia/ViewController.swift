//
//  ViewController.swift
//  Axaia
//
//  Created by Mikołaj Wielocha on 18/01/15.
//  Copyright (c) 2015 Mikołaj Wielocha. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func connect(sender : AnyObject) {
       println("Clicked!")
    
        let cassandra = CassObjc()
        cassandra.connect("127.0.0.1")
    }
}

