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

class QuestionController: UIViewController {

    var titleLabel:UILabel!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var imageView: OmniCarouselView!
    
//    @IBOutlet weak var imageView: OmniCarouselView!
    var answerTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = .None
        // Do any additional setup after loading the view.
        
        //init title label
        titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text = "Question Title"
        titleLabel.sd_layout()
            .topSpaceToView(view, 0)
            .leftSpaceToView(view, 0)
            .rightSpaceToView(view, 0)
            .heightIs(64)
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont(name: "Helvetica", size: 32)
        
        //init imageview
//        let imageView = OmniCarouselView();
//        view.addSubview(imageView)
//        imageView.sd_layout()
//            .topSpaceToView(titleLabel, 0)
//            .leftSpaceToView(view, 0)
//            .rightSpaceToView(view, 0)
//            .heightIs(100)
//        let images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4")]
//        imageView.contents = images
//            .filter({$0 != nil})
//            .map({OmniCarouselView.Content.Image($0!)})
        
        // from url
//        let imageUrls = Array(1...3).map({i in NSURL(string: "https://raw.githubusercontent.com/nakaji-dayo/OmniCarouselView/master/Example/OmniCarouselView/Images.xcassets/beer\(i).imageset/beer\(i).jpeg")})
//        carouselView2.contents = imageUrls.filter({$0 != nil}).map({OmniCarouselView.Content.ImageUrl($0!)})

        // show other view
//        let labels = Array(0..<3).map { (i) -> UILabel in
//            let label = UILabel()
//            label.text = "label:\(i)"
//            return label
//        }
//        carouselView3.contents = labels.map({OmniCarouselView.Content.View($0)})
        
//        view.addSubview(answerTable)
//        answerTable.sd_layout()
//            .topSpaceToView(imageView, 0)
//            .bottomSpaceToView(view, 0)
//            .rightSpaceToView(view, 0)
//            .leftSpaceToView(view, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
