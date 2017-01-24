//
//  ViewController.swift
//  SMTextView
//
//  Created by Spencer Mandrusiak on 2017-01-22.
//  Copyright © 2017 Spencer Mandrusiak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: SMTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        textView.resignFirstResponder()
    }
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print(textView.text)
    }
}
