//
//  SMTextView.swift
//  Pods
//
//  Created by Spencer Mandrusiak on 2017-04-24.
//
//

import UIKit

@IBDesignable public class SMTextView: UITextView {

    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var placeholder: String = "Placeholder" {
        didSet {
            if text != "" {
                placeholder = ""
            }
        }
    }

    @IBInspectable var placeholderColor: UIColor = .lightGray
    @IBInspectable var borderColor: UIColor = .red
    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var topInset: CGFloat = 0
    @IBInspectable var leftInset: CGFloat = 0
    @IBInspectable var bottomInset: CGFloat = 0
    @IBInspectable var rightInset: CGFloat = 0

    public override var text: String! {
        didSet {
            if text != "" {
                placeholder = ""
            }
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
    }

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
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

    override public func awakeFromNib() {
        super.awakeFromNib()
        initPlaceholder()
    }


    //MARK: Actions
    func placeholderTapped(_ recognizer: UITapGestureRecognizer) {
        _ = self.becomeFirstResponder()
    }
}
