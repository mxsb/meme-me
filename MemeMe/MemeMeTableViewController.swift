//
//  MemeMeTableView.swift
//  MemeMe
//
//  Created by Schwaab, Max on 30/01/2017.
//  Copyright © 2017 Schwaab, Max. All rights reserved.
//

import UIKit

class MemeMeTableViewController: UITableViewController {

    var memes: [Meme]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeMeTableCell")!
        let meme = memes[(indexPath as NSIndexPath).row]
    
        cell.textLabel?.text = meme.topText + "..." + meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        detailController.meme = self.memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    func updateData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.memes = appDelegate.memes
    }
    
}
