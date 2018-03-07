/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    The collection view cell used in the lightbox collection view.
*/

import UIKit

class LightboxCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "LightboxCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
}
