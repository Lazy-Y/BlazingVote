//
//  QuestionController.swift
//  BlazingVote
//
//  Created by 钟镇阳 on 5/19/16.
//  Copyright © 2016 ZhenyangZhong. All rights reserved.
//

import UIKit
import SDAutoLayout
import OmniCarouselView

class QuestionController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var titleLabel:UILabel!
    
    @IBOutlet weak var descriptField: UITextView!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var textFieldHeight: NSLayoutConstraint!
    
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var collection: UICollectionView!
    
//    @IBOutlet weak var imageView: OmniCarouselView!
    
    var answerTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.registerNib(UINib(nibName: "Images", bundle: nil), forCellWithReuseIdentifier: "imageCell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(64, 64)
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        collection.collectionViewLayout = layout
        
        edgesForExtendedLayout = .None
        // Do any additional setup after loading the view.
        
        //init title label
        titleLabel = UILabel()
        topView.addSubview(titleLabel)
        titleLabel.text = "Question Title"
        titleLabel.sd_layout()
            .topSpaceToView(topView, 0)
            .leftSpaceToView(topView, 0)
            .rightSpaceToView(topView, 0)
            .heightIs(64)
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont(name: "Helvetica", size: 32)
        
        descriptField.text = "Here is the problem description END"
        topView.addSubview(descriptField)
        descriptField.scrollEnabled = false

        let sizeThatFitsTextView = descriptField.sizeThatFits(CGSizeMake(descriptField.frame.width, CGFloat(MAXFLOAT)))
        
        textFieldHeight.constant = sizeThatFitsTextView.height * 1.8 - 30
        descriptField.editable = false
        descriptField.selectable = false
        
        //init collection
        collection.delegate = self
        collection.dataSource = self
        
        
        //init imageview
//        let imageView = OmniCarouselView();
//        view.addSubview(imageView)
//        let images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4")]
//        imageView.contents = images
//            .filter({$0 != nil})
//            .map({OmniCarouselView.Content.Image($0!)})
//        imageView.backgroundColor = UIColor.lightGrayColor()
        
        
        topView.addSubview(answerTable)
        answerTable.sd_layout()
            .topSpaceToView(collection, 0)
            .bottomSpaceToView(topView, 0)
            .rightSpaceToView(topView, 0)
            .leftSpaceToView(topView, 0)
//        answerTable.backgroundColor = UIColor.lightGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        collectionHeight.constant = CGFloat(2) * 74 + 10
        return 8
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
    
    override func viewDidAppear(animated: Bool) {

    }
}
