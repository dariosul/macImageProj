/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    Application Lightbox view controller.
*/

import UIKit
import Photos

/**
        This UICollectionViewController displayes all images in
        a selected asset collection from the Photos library.
 */
class LightboxCollectionViewController: UICollectionViewController {
    // MARK: Properties

    let imageSegueName = "ImageSegue"

    var assetCollection : PHAssetCollection?
    var assets = [PHAsset]()

    /// Requests all image of the assetCollections to be fetched.
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let assetCollection = assetCollection else {
            return
        }

        PHAsset.fetchKeyAssets(in: assetCollection, options: PHFetchOptions())!.enumerateObjects( {
            (item, idx, flag) in self.assets.append(item)
        })
    }

    // MARK: UICollectionViewController delegate methods

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LightboxCollectionViewCell.reuseIdentifier, for: indexPath) as? LightboxCollectionViewCell else { fatalError("Unable to dequeue a LightboxCollectionViewCell") }
        let asset = assets[indexPath.row]
        
        cell.imageView.image = nil
        
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        PHCachingImageManager.default().requestImage(for: asset, targetSize: cell.bounds.size, contentMode: PHImageContentMode.aspectFit, options: options) {
            requestedImage, _ in cell.imageView.image = requestedImage
        }

        return cell
    }

    // MARK: Storyboard seque

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: imageSegueName, sender: assets[indexPath[1]])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageViewController = segue.destination as? ImageViewController else { return }
        guard let asset = sender as? PHAsset else { return }

        imageViewController.asset = asset
    }
}
