//
//  ViewController.swift
//  Dynamic type test
//
//  Created by Brenna Olson on 2/1/17.
//  Copyright © 2017-2018 Brenna Olson. All rights reserved.
//
//  REUSE AND REDISTRIBUTION NOTICE: You are free to download, use, and modify this code for personal use, provided that this copyright disclaimer appears in all files included in the original work. You may not redistribute this code in any form including, but not limited to, source or binary.

import UIKit

/// A simple data type to store info about a Dynamic Type style
struct TextStyle {
    /// The name of the style displayed in a table view cell
    let name: String
    /// The `UIFontTextStyle` equivalent of `name`
    let value: UIFontTextStyle
}

class ViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var doneButton: UIBarButtonItem!
    
    
    /// Easily retrieve the current Dynamic Type style being used
    var currentStyle = UIFontTextStyle.body
    var previousStyleButton = UIButton()
    
    /// All possible Dynamic Type styles associated with a `String` version of them
    let textStyles = [TextStyle(name: "Title 1", value: .title1),
                      TextStyle(name: "Title 2", value: .title2),
                      TextStyle(name: "Title 3", value: .title3),
                      TextStyle(name: "Headline", value: .headline),
                      TextStyle(name: "Subheadline", value: .subheadline),
                      TextStyle(name: "Body", value: .body),
                      TextStyle(name: "Footnote", value: .footnote),
                      TextStyle(name: "Caption 1", value: .caption1),
                      TextStyle(name: "Caption 2", value: .caption2),
                      TextStyle(name: "Callout", value: .callout)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.adjustsFontForContentSizeCategory = true
        
        // keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: Notification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notification:)), name: Notification.Name.UIKeyboardDidHide, object: nil)
        
        // the text view isn't the first responder when the view controller first appears, so there's no reason to have the done button showing initially
        navigationController?.navigationBar.topItem?.rightBarButtonItem = nil
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        let keyboardHeight = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! CGRect).size.height
        mainScrollView.contentSize.height += keyboardHeight
        mainScrollView.setContentOffset(CGPoint(x: 0, y: keyboardHeight), animated: true)
        navigationController?.navigationBar.topItem?.rightBarButtonItem = doneButton
    }

    @objc func keyboardDidHide(notification: Notification) {
        let keyboardHeight = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! CGRect).size.height
        mainScrollView.contentSize.height -= keyboardHeight
        mainScrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        textView.resignFirstResponder()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = nil
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView(tableView, cellForRowAt: indexPath)

        // remove checkmark on previously selected cell by looking up currentStyle in textStyles
        if let previousIndex = textStyles.index(where: { $0.value == currentStyle }) {
            let previousStyleCell = self.tableView(tableView, cellForRowAt: IndexPath(row: previousIndex, section: 0))
            previousStyleCell.accessoryType = .none
        }
        
        // set the style based on the currently selected cell's text by looking it up in textStyles
        if let text = cell.textLabel?.text {
            if let value = textStyles.first(where: { $0.name == text })?.value {
                currentStyle = value
                cell.accessoryType = .checkmark
            }
        }
        
        textView.font = UIFont.preferredFont(forTextStyle: currentStyle)
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textStyles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textStyleCell", for: indexPath)
        
        cell.textLabel?.text = textStyles[indexPath.row].name
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: textStyles[indexPath.row].value)
        
        // if the index is the same as currentStyle, put a checkmark; else, put nothing
        if indexPath.row == textStyles.index(where: { $0.value == currentStyle }) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}

