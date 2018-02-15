//
//  ViewController.swift
//  Collection view test
//
//  Created by Brenna Olson on 5/14/16.
//  Copyright © 2016-2017 Brenna Olson. All rights reserved.
//
//  REUSE AND REDISTRIBUTION NOTICE: You are free to download, use, and modify this code for personal use, provided that this copyright disclaimer appears in all files included in the original work. You may not redistribute this code in any form including, but not limited to, source or binary.

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n")
        printSeparator()
        print(" ******DestinationViewController****** ")
        printSeparator()
        print("viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printSeparator()
        print("|   ***DestinationViewController***    |")
        printSeparator()
        print("viewWillAppear(_:)")
    }
}

