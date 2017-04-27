//
//  SMTextView.swift
//  Pods
//
//  Created by Spencer Mandrusiak on 2017-04-24.
//
//

import UIKit

@IBDesignable public class SMTextView: UITextView {

    //MARK: - Variables
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
    @IBInspectable public var rightInset: CGFloat = 0 {
        didSet {
            refreshPlaceholderInput()
        }
    }
    private var bottomInset: CGFloat = 24 {
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

    public var isCharacterCountEnabled = true {
        didSet {
            if !isCharacterCountEnabled {
                counterLabel.removeFromSuperview()
            }
        }
    }
    public var maxCharacterCount = 100 {
        didSet {
            updateCounterLabelMax()
        }
    }

    //MARK: - Additional Views
    fileprivate var placeholderTextView: UITextView!
    fileprivate var counterLabel: UILabel!


    //MARK: - Overrides
    override public func draw(_ rect: CGRect) {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        textContainerInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        placeholderTextView.textContainerInset = textContainerInset
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        initPlaceholder()
        initLabel()

    }

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        delegate = self
        initPlaceholder()
        initLabel()
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
        initLabel()
    }

    //MARK: Actions
    func placeholderTapped(_ recognizer: UITapGestureRecognizer) {
        _ = self.becomeFirstResponder()
    }
}

//MARK: - Custom Initialization
extension SMTextView {
    fileprivate func initPlaceholder() {
        placeholderTextView = UITextView(frame: bounds)
        placeholderTextView.font = font
        placeholderTextView.text = placeholder
        placeholderTextView.textColor = placeholderColor
        placeholderTextView.textAlignment = textAlignment
        placeholderTextView.backgroundColor = .clear
        placeholderTextView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(placeholderTapped)))
        addSubview(placeholderTextView)
    }

    fileprivate func initLabel() {
        if isCharacterCountEnabled {
            counterLabel = UILabel()
            counterLabel.font = counterLabel.font.withSize(10)
            counterLabel.text = "0/\(maxCharacterCount)"
            updateCounterLabel()
            addSubview(counterLabel)
        }
    }
}

//MARK: - Update Methods
extension SMTextView {
    fileprivate func updateCounterLabel() {
        setNeedsLayout()
        layoutIfNeeded()

        counterLabel.sizeToFit()
        let x = bounds.maxX-counterLabel.bounds.width-8
        let y = bounds.maxY-counterLabel.bounds.height-8
        counterLabel.frame.origin = CGPoint(x: x, y: y)
    }

    fileprivate func updateCounterLabelMax() {
        counterLabel.text = "0/\(maxCharacterCount)"
        counterLabel.sizeToFit()
    }

    fileprivate func refreshPlaceholderInput() {
        placeholderTextView.font = font
        placeholderTextView.text = placeholder
        placeholderTextView.textColor = placeholderColor
        placeholderTextView.textAlignment = textAlignment
    }
}

//MARK: - UITextViewDelegate
extension SMTextView: UITextViewDelegate {
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if isCharacterCountEnabled {
            return textView.text.characters.count + text.characters.count - range.length <= maxCharacterCount
        }
        return true
    }
    public func textViewDidChange(_ textView: UITextView) {
        if isCharacterCountEnabled {
            let count = textView.text.characters.count
            counterLabel.text = "\(count)/\(maxCharacterCount)"
            updateCounterLabel()
        }
    }
}
