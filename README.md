# SMTextView

[![CI Status](http://img.shields.io/travis/mandrusiaks/SMTextView.svg?style=flat)](https://travis-ci.org/mandrusiaks/SMTextView)
[![Version](https://img.shields.io/cocoapods/v/SMTextView.svg?style=flat)](http://cocoapods.org/pods/SMTextView)
[![License](https://img.shields.io/cocoapods/l/SMTextView.svg?style=flat)](http://cocoapods.org/pods/SMTextView)
[![Platform](https://img.shields.io/cocoapods/p/SMTextView.svg?style=flat)](http://cocoapods.org/pods/SMTextView)

A custom implementation of UITextView with a placeholder and character count. This implementation contains the ability to customize top, left, and right insets individually. SMTextView is compatible with Interface Builder. SMTextView also contains a character count that can be enabled/disabled. To disable, simply set isCharacterCountEnabled to false.

NOTE: Due to character count label, bottomInset is currently no longer customizable. This may be re-enabled in the future. If character count is disabled, bottomInset = topInset.


| ![SMTextView](SMTextView/Assets/SMTextView.png) | ![SMTextView2](SMTextView/Assets/IB.png) |
|:-----------------------------------------------:|:----------------------------------------:|

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Usage

Instead of using Interface Builder, you can customize properties manually in code.

By default, SMTextView's character count is enabled. To hide the character count for SMTextView, simply set ```isCharacterCountEnabled = false```

Optionally, you can set ```maxCharacterCount```. The default character count is 100.

```swift

@IBOutlet weak var textView: SMTextView!

...

override func viewDidLoad() {
    super.viewDidLoad()
    textView.placeholder = "Enter details about the event."
    textView.placeholderColor = .purple
    textView.topInset = 45
    textView.leftInset = 15
    textView.rightInset = 15
    textView.maxCharacterCount = 200
}


```

## Requirements

## Installation

### CocoaPods
SMTextView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SMTextView"
```

### Manual

Alternatively, you can simply add ```SMTextView.swift``` to your project.


## License

SMTextView is available under the MIT license. See the LICENSE file for more info.
