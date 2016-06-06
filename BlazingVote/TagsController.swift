//
//  TagsController.swift
//  BlazingVote
//
//  Created by Zhenyang Zhong on 6/5/16.
//  Copyright © 2016 ZhenyangZhong. All rights reserved.
//

import UIKit
import TagListView

class TagsController: UIViewController, TagListViewDelegate {

    @IBOutlet weak var tagView: TagListView!
    
    @IBAction func back(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneAction(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBAction func addAction(sender: AnyObject) {
        if let text = textField.text{
            if !text.isEmpty {
                tagView.addTag(text)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .None
        
        // Do any additional setup after loading the view.
        tagView.textFont = UIFont.systemFontOfSize(20)
        tagView.alignment = .Left // possible values are .Left, .Center, and .Right
        
        tagView.delegate = self
//        tagView.removeTag("meow") // all tags with title “meow” will be removed
//        tagView.removeAllTags()
        tagView.enableRemoveButton = true
    }
    func tagRemoveButtonPressed(title: String, tagView: TagView, sender: TagListView) -> Void{
        self.tagView.removeTagView(tagView)
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
