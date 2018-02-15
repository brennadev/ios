//
//  CollectionViewController.swift
//  Collection view test
//
//  Created by Brenna Olson on 5/14/16.
//  Copyright © 2016-2017 Brenna Olson. All rights reserved.
//
//  REUSE AND REDISTRIBUTION NOTICE: You are free to download, use, and modify this code for personal use, provided that this copyright disclaimer appears in all files included in the original work. You may not redistribute this code in any form including, but not limited to, source or binary.

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var leftBarButtonItem: UIBarButtonItem!
    // TODO: the reason this is here is because when scrolling, there's a lot of viewWillLayoutSubviews and viewDidLayoutSubviews calls - my goal is to just show the first set of those calls (or 2 or however many more if there's a cellForItemAt, etc. call)
    var shouldPrintLayoutSubviews = true
    
    /// Makes sure lines for viewWillLayoutSubviews and viewDidLayoutSubviews are printed after a cellForItemAt call
    var isAfterCellForItemAt = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n")
        printSeparator()
        print("  ******CollectionViewController******  ")
        printSeparator()
        print("viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //shouldPrintLayoutSubviews = true
        printSeparator()
        print("|    ***CollectionViewController***    |")
        printSeparator()
        print("viewWillAppear(_:)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear(_:)")
    }
    
    override func viewWillLayoutSubviews() {
        //if shouldPrintLayoutSubviews || isAfterCellForItemAt {
            print("viewWillLayoutSubviews()")
        //}
    }
    
    override func viewDidLayoutSubviews() {
        //if shouldPrintLayoutSubviews || isAfterCellForItemAt {
            print("viewDidLayoutSubviews()")
        //}
        
        //if !shouldPrintLayoutSubviews {
            //isAfterCellForItemAt = false
        //}
        //shouldPrintLayoutSubviews = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning()")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("viewWillTransition to size()")
        //shouldPrintLayoutSubviews = true
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print("willTransition(to:with:)")
        //shouldPrintLayoutSubviews = true
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "masterToDetail" {
            print("prepare(for:sender:))")
        }
        //shouldPrintLayoutSubviews = true
    }
    

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("numberOfSections(in:)")
        //shouldPrintLayoutSubviews = true
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("collectionView(_:numberOfItemsInSection:) for section \(section)")
        //shouldPrintLayoutSubviews = true
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.cyan
        
        // only want line below when not scrolling (when view initially shows, there's no viewWillLayoutSubviews or viewDidLayoutSubviews calls between the cellForItemAt calls
        // I think the thing I noted above may be the only thing that needs to be fixed
        //print("viewWillLayoutSubviews()")
        print("collectionView(_:cellForItemAt:) at item \(indexPath.item)")
        
        // flags controlling viewWillLayoutSubviews/viewDidLayoutSubviews output
        //shouldPrintLayoutSubviews = true
        //isAfterCellForItemAt = true
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        //shouldPrintLayoutSubviews = true
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        //shouldPrintLayoutSubviews = true
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        //shouldPrintLayoutSubviews = true
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("collectionView(_:didHighlightItemAt:) at item \(indexPath.item)")
        //shouldPrintLayoutSubviews = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        print("collectionView(_:didUnhighlightItemAt:) at item \(indexPath.item)")
        //shouldPrintLayoutSubviews = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView(_:didSelectItemAt:) at item \(indexPath.item)")
        //shouldPrintLayoutSubviews = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("collectionView(_:didDeselectItemAt:) at item \(indexPath.item)")
        //shouldPrintLayoutSubviews = true
    }
}
