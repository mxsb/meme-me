//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Schwaab, Max on 01/02/2017.
//  Copyright © 2017 Schwaab, Max. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme:Meme!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        self.imageView!.image = meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
