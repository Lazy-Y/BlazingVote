//
//  CollectionController.swift
//  BlazingVote
//
//  Created by 钟镇阳 on 5/19/16.
//  Copyright © 2016 ZhenyangZhong. All rights reserved.
//

import UIKit
import SFFocusViewLayout

class CollectionController: UIViewController{

    let repository = Repository()
    let renderer = Renderer()
    
    @IBAction func showSetting(sender: AnyObject) {
        drawer.toggleDrawerSide(.Right, animated: true, completion: nil)
    }
    @IBAction func showProfile(sender: AnyObject) {
        drawer.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
    
    var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        edgesForExtendedLayout = .None
        // Do any additional setup after loading the view.
        collectionView = UICollectionView(frame: CGRectMake(0, 0, 100, 100), collectionViewLayout: SFFocusViewLayout())
        view.addSubview(collectionView)
        collectionView.sd_layout()
            .topSpaceToView(view, 0)
            .bottomSpaceToView(view, 0)
            .leftSpaceToView(view, -20)
            .rightSpaceToView(view, -20)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CollectionViewCell)
        
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        collectionView.backgroundColor = UIColor.lightGrayColor()
        
    }
    
    var questionArr = ["Hello", "World", "Blazing", "Vote", "Zhenyang", "Zhong"]
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension CollectionController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repository.count
    }
    
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(forIndexPath: indexPath) as CollectionViewCell
    }
    
    func collectionView(collectionView: UICollectionView,
                        willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        guard let cell = cell as? CollectionViewCellRender else {
            fatalError("error with registred cell")
        }
        
        renderer.presentModel(repository[indexPath.item], inView: cell)
    }
}

extension CollectionController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        guard let focusViewLayout = collectionView.collectionViewLayout as? SFFocusViewLayout else {
            fatalError("error casting focus layout from collection view")
        }
        
        let offset = focusViewLayout.dragOffset * CGFloat(indexPath.item)
        if collectionView.contentOffset.y != offset {
            collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
        }
        
    }
    
}
