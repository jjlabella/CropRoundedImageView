//
//  CropRoundedImageView.swift
//  CropRoundedImageView
//
//  Created by Juan Jose Labella on 25/11/15.
//  Copyright (c) 2015 jjlabella. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CropRoundImageView : UIImageView {
    
    private var _crop = false
    private var _rounded = false
    
    
    
    //--------------------------------------------------
    // INSPECTABLE
    //--------------------------------------------------
    @IBInspectable var borderColor : UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBInspectable var crop: Bool {
        set {
            _crop = newValue
            _cropImage()
        }
        get {
            return self._crop
        }
    }
    
    @IBInspectable var rounded: Bool {
        set {
            _rounded = newValue
            _makeRound()
        }
        get {
            return self._rounded
        }
    }
    
    
    //--------------------------------------------------
    // PUBLIC ACTIONS
    //--------------------------------------------------
    // ROUNDED
    func makeRound() {
        self._rounded = true
        _makeRound()
    }
    // CROPPED
    func cropImage(){
        self._crop = true
        _cropImage()
    }
    
    //--------------------------------------------------
    // APPLY FILTERS
    //--------------------------------------------------
    // ROUNDED
    func load() {
        _makeRound()
        _cropImage()
    }
    
    //--------------------------------------------------
    // PRIVATE ACTIONS
    //--------------------------------------------------
    // ROUNDED
    private func _makeRound() {
        if self._rounded == true {
            self.clipsToBounds = true
            self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
        } else {
            self.layer.cornerRadius = 0
        }
    }
    
    
    // CROPPED
    private func _cropImage(){
        
        if self._crop == true {
            let image : UIImage  = self.image!
            
            let contextSize: CGSize = image.size
            
            var posX: CGFloat = 0.0
            var posY: CGFloat = 0.0
            var cgwidth: CGFloat = image.size.width
            var cgheight: CGFloat = image.size.height
            
            // See what size is longer and create the center off of that
            if contextSize.width > contextSize.height {
                posX = ((contextSize.width - contextSize.height) / 2)
                posY = 0
                cgwidth = contextSize.height
                cgheight = contextSize.height
            } else {
                posX = 0
                posY = ((contextSize.height - contextSize.width) / 2)
                cgwidth = contextSize.width
                cgheight = contextSize.width
            }
            
            let croprect: CGRect = CGRectMake(posX, posY, cgwidth, cgheight)
            
            
            let imageRef: CGImageRef = CGImageCreateWithImageInRect(image.CGImage, croprect);
            let croppedImage: UIImage = UIImage(CGImage: imageRef, scale: image.scale, orientation: image.imageOrientation)!
            
            self.image = croppedImage
        } else {
            let image : UIImage  = self.image!
            self.image = image
        }
        
    }
    
}
