/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    The collection view cell used in the album collection view.
*/

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AlbumCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
}
