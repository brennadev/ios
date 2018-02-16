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
    
    // MARK: - View Controller Lifecycle
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
        print("viewWillLayoutSubviews()")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews()")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning()")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("viewWillTransition to size()")
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print("willTransition(to:with:)")
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "masterToDetail" {
            print("prepare(for:sender:))")
        }
    }
    

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("numberOfSections(in:)")
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("collectionView(_:numberOfItemsInSection:) for section \(section)")
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.contentView.backgroundColor = UIColor.cyan

        print("collectionView(_:cellForItemAt:) at item \(indexPath.item)")
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("collectionView(_:didHighlightItemAt:) at item \(indexPath.item)")
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        print("collectionView(_:didUnhighlightItemAt:) at item \(indexPath.item)")
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView(_:didSelectItemAt:) at item \(indexPath.item)")
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("collectionView(_:didDeselectItemAt:) at item \(indexPath.item)")
    }
}
