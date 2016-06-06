//
//  PostController.swift
//  BlazingVote
//
//  Created by Zhenyang Zhong on 6/5/16.
//  Copyright © 2016 ZhenyangZhong. All rights reserved.
//

import UIKit

class PostController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var collection: UICollectionView!
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 1
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCell", forIndexPath: indexPath)
        let imageView = UIImageView(image: getRandomColorImage())
        cell.addSubview(imageView)
        imageView.sd_layout()
            .topSpaceToView(cell, 0)
            .leftSpaceToView(cell, 0)
            .rightSpaceToView(cell, 0)
            .bottomSpaceToView(cell, 0)
        return cell
    }
    
    @IBAction func cancelActin(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .None
        // Do any additional setup after loading the view.
        collection.registerNib(UINib(nibName: "Images", bundle: nil), forCellWithReuseIdentifier: "imageCell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(64, 64)
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        collection.collectionViewLayout = layout
        collection.delegate = self
        collection.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
