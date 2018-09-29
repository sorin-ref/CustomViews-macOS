//
//  CustomView.swift
//  CustomViews
//
//  Created by Sorin Dolha on 15.04.2018.
//  Copyright © 2018 SDolha. All rights reserved.
//

import Cocoa

@IBDesignable
public class CustomView: NSView, NSTextFieldDelegate {
    @IBOutlet var contentView: NSView!
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var label: NSTextField!
    
    @IBInspectable var labelColor: NSColor! {
        didSet {
            label.textColor = labelColor
        }
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        initializeContent()
    }
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        initializeContent()
    }
    private func initializeContent() {
        let resource = NSNib(nibNamed: String(describing: CustomView.self),
                             bundle: Bundle(for: CustomView.self))!
        resource.instantiate(withOwner: self, topLevelObjects: nil)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        layoutSubtreeIfNeeded()
        
        textField.delegate = self
    }
    
    public override func controlTextDidChange(_ notification: Notification) {
        label.stringValue = textField.stringValue
    }
}
