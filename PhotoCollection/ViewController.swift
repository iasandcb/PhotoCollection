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
    
    let balls = ["Baseball", "Basketball", "Football"]
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return balls.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PHOTO_CELL", forIndexPath: indexPath) as! PhotoCell
        let url = NSURL(string: "https://raw.githubusercontent.com/wannabewize/TAcademy_iOS_Samples/master/Book1/10_ListScene/TableCatalog/TableCatalog/product_images/\(balls[indexPath.row]).png")
//        let data = NSData(contentsOfURL: url!)
//        cell.imageView.image = UIImage(data: data!)
//        
//        let imageView = UIImageView(frame: frame)
//        let URL = NSURL(string: "https://httpbin.org/image/png")!
        let placeholderImage = UIImage(named: "default-placeholder")!
        
        cell.imageView.af_setImageWithURL(url!, placeholderImage: placeholderImage)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

