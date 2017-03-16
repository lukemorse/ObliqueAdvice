//
//  NewSubmissionVC.swift
//  Oblique Advice
//
//  Created by Luke Morse on 3/16/17.
//  Copyright © 2017 Luke Morse. All rights reserved.
//

import UIKit
import Firebase

class NewSubmissionVC: UIViewController, UITextViewDelegate {

    let placeHolderText = "Give some helpful advice to your neighbor!"
    @IBOutlet var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.text = placeHolderText
        textField.textColor = .lightGray
    }

    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if (textField.text == placeHolderText) {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder() //Optional
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textField.text == "") {
            textField.text = placeHolderText
            textField.textColor = .lightGray
        }
        textField.resignFirstResponder()
    }

    @IBAction func onSubmitButtonPressed(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
