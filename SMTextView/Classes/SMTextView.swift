//
//  SMTextView.swift
//  Pods
//
//  Created by Spencer Mandrusiak on 2017-04-24.
//
//

import UIKit

@IBDesignable public class SMTextView: UITextView {

    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            refreshPlaceholderInput()
        }
    }
    @IBInspectable public var placeholder: String = "Placeholder" {
        didSet {
            if text != "" {
                placeholder = ""
            }
            refreshPlaceholderInput()
        }
    }
    @IBInspectable public var placeholderColor: UIColor = .lightGray {
        didSet {
            refreshPlaceholderInput()
        }
    }
    @IBInspectable public var borderColor: UIColor = .red {
        didSet {
            refreshPlaceholderInput()
        }
    }
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            refreshPlaceholderInput()
        }
    }
    @IBInspectable public var topInset: CGFloat = 0 {
        didSet {
            refreshPlaceholderInput()
        }
    }
    @IBInspectable public var leftInset: CGFloat = 0 {
        didSet {
            refreshPlaceholderInput()
        }
    }
    @IBInspectable public var bottomInset: CGFloat = 0 {
        didSet {
            refreshPlaceholderInput()
        }
    }
    @IBInspectable public var rightInset: CGFloat = 0 {
        didSet {
            refreshPlaceholderInput()
        }
    }

    public override var text: String! {
        didSet {
            if text != "" {
                placeholder = ""
            }
            refreshPlaceholderInput()
        }
    }

    private var placeholderTextView: UITextView!

    override public func draw(_ rect: CGRect) {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        textContainerInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        placeholderTextView.textContainerInset = textContainerInset
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initPlaceholder()
    }

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        initPlaceholder()
    }

    private func initPlaceholder() {
        placeholderTextView = UITextView(frame: bounds)
        placeholderTextView.font = font
        placeholderTextView.text = placeholder
        placeholderTextView.textColor = placeholderColor
        placeholderTextView.textAlignment = textAlignment
        placeholderTextView.backgroundColor = .clear
        placeholderTextView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(placeholderTapped)))
        addSubview(placeholderTextView)
    }
    private func refreshPlaceholderInput() {
        placeholderTextView.font = font
        placeholderTextView.text = placeholder
        placeholderTextView.textColor = placeholderColor
        placeholderTextView.textAlignment = textAlignment
    }

    override public func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        placeholderTextView.isHidden = true
        return true
    }

    override public func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        if placeholderTextView != nil {
            if self.text.characters.count > 0 {
                placeholderTextView.isHidden = true
            }else {
                placeholderTextView.isHidden = false
            }
        }
        return true
    }

    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initPlaceholder()
    }

    //MARK: Actions
    func placeholderTapped(_ recognizer: UITapGestureRecognizer) {
        _ = self.becomeFirstResponder()
    }
}
