//
//  ViewController.swift
//  PhotoCollection
//
//  Created by SDT2 on 2015. 10. 29..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NetworkManager.sharedManager.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PHOTO_CELL", forIndexPath: indexPath) as! PhotoCell
        let url = NSURL(string: NetworkManager.sharedManager.images[indexPath.row])
//        let data = NSData(contentsOfURL: url!)
//        cell.imageView.image = UIImage(data: data!)
        let placeholderImage = UIImage(named: "default-placeholder")!
        cell.imageView.af_setImageWithURL(url!, placeholderImage: placeholderImage)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "tapped:")
        tapRecognizer.allowedPressTypes = [NSNumber(integer: UIPressType.PlayPause.rawValue)];
        self.view.addGestureRecognizer(tapRecognizer)
        NetworkManager.sharedManager.fetchImages()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleUpdate", name: ImageUpatedNotification, object: nil)
    }
    
    func handleUpdate() {
        collectionView.reloadData()
    }
    
    func tapped(tap: UITapGestureRecognizer) {
        print(tap)
        NetworkManager.sharedManager.fetchImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

