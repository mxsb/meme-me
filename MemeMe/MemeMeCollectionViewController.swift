//
//  MemeMeCollectionViewController.swift
//  MemeMe
//
//  Created by Schwaab, Max on 30/01/2017.
//  Copyright © 2017 Schwaab, Max. All rights reserved.
//

import UIKit

class MemeMeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let columns: CGFloat = 3.0
    let rows: CGFloat = 3.0
    let space:CGFloat = 5.0
    
    var memes: [Meme]!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(MemeMeCollectionViewController.orientationChange), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
//        let with = (view.frame.size.width - (2 * self.space)) / self.columns
//        let height = (view.frame.size.height - (2 * self.space)) / self.rows
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
//        flowLayout.itemSize = CGSize(width: with, height: height)
        
        updateData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
        self.collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeMeCollectionCell", for: indexPath) as! MemeMeCollectionCell
        let meme = self.memes[indexPath.row]
        
        cell.imageView.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        detailController.meme = self.memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let with = (view.frame.size.width - (2 * self.space)) / self.columns
        let height = (view.frame.size.height - (2 * self.space)) / self.rows
        
        return CGSize(width: with, height: height)
    }
    
    func updateData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.memes = appDelegate.memes
    }

    func orientationChange() {
        if UIDevice.current.orientation.isLandscape {
        } else {
        }
        collectionView?.collectionViewLayout.invalidateLayout()
        print("rotate")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
