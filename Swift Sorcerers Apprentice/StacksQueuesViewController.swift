//
//  StacksViewController.swift
//  Swift Sorcerers Apprentice
//
//  Created by Ryo Tulman on 6/21/14.
//  Copyright (c) 2014 Ryo Tulman. All rights reserved.
//

import UIKit

class StacksQueuesViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var listTypeControl: UISegmentedControl
    @IBOutlet var pushNodeButton: UIButton
    @IBOutlet var pushNodeTextField: UITextField
    @IBOutlet var popNodeButton: UIButton
    @IBOutlet var popNodeLabel: UILabel
    @IBOutlet var textView: UITextView
    var head: ListNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pushNodeTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    enum ListType {
        case Stack, Queue
        func simpleDescription() -> String {
            switch self {
            case .Stack:
                return "Stack"
            case .Queue:
                return "Queue"
            }
        }
    }
    
    func currentListType() -> ListType {
        switch self.listTypeControl.selectedSegmentIndex {
        case 0:
            return .Stack
        default:
            return .Queue
        }
    }
    
    @IBAction func pushNodePressed(sender: UIButton) {
        
        var nodeValue: Int
        if let textFieldEntryNum = pushNodeTextField.text.toInt() {
            nodeValue = textFieldEntryNum
        } else {
            nodeValue = 0
        }
        
        if let currHead = self.head {
            switch self.currentListType() {
            case ListType.Stack:
                var newHead = ListNode(value: nodeValue)
                newHead.next = currHead
                self.head = newHead
            case ListType.Queue:
                var currNode = currHead
                while let nextNode = currNode.next {
                    currNode = nextNode
                }
                //add new node as the next of the last node
                currNode.next = ListNode(value: nodeValue)
            }
        } else {
            //if no head set it
            self.head = ListNode(value: nodeValue)
        }
        
        textView.text = textView.text + "\n\(self.wholeStack())\nEND" //can't yet += this because of old api
    }
    
    @IBAction func popNodePressed(sender: UIButton) {
        if let head = self.head {
            popNodeLabel.text = "\(head.value)"
            if let headNext = head.next {
                self.head = headNext
            } else {
                self.head = nil
            }
            textView.text = textView.text + "\n\(self.wholeStack())\nEND"
        } else {
            textView.text = textView.text + "\nNothing to Pop/Dequeue!"
            popNodeLabel.text = "N/A"
        }
    }
    
    func wholeStack() -> Array<Int> {
        var stackArray: Int[] = []
        if let head = self.head {
            stackArray.append(head.value)
            var currNode = head
            while let nextNode = currNode.next {
                stackArray.append(nextNode.value)
                currNode = nextNode
            }
        }
        return stackArray
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
