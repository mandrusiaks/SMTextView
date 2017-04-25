//
//  ViewController.swift
//  SMTextView
//
//  Created by mandrusiaks on 04/24/2017.
//  Copyright (c) 2017 mandrusiaks. All rights reserved.
//

import UIKit
import SMTextView

class ViewController: UIViewController {

    @IBOutlet weak var textView: SMTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        _ = textView.resignFirstResponder()
    }
}

