//
//  CustomView.swift
//  CustomViews
//
//  Created by Sorin Dolha on 15.04.2018.
//  Copyright © 2018 SDolha. All rights reserved.
//

import Cocoa

@IBDesignable public class CustomView: NSView, NSTextFieldDelegate {
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
    func initializeContent() {
        let resourceType = type(of: self)
        let resourceName = NSNib.Name(rawValue: String(describing: resourceType))
        let resource = NSNib(nibNamed: resourceName, bundle: Bundle(for: resourceType))!
        resource.instantiate(withOwner: self, topLevelObjects: nil)
        canDrawSubviewsIntoLayer = true
        addSubview(contentView)
        
        textField.delegate = self
    }
    
    public override func controlTextDidChange(_ notification: Notification) {
        label.stringValue = textField.stringValue
    }
}
