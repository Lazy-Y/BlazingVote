//
//  ViewController.swift
//  BlazingVote
//
//  Created by 钟镇阳 on 5/17/16.
//  Copyright © 2016 ZhenyangZhong. All rights reserved.
//

import UIKit
import SFFocusViewLayout
import MMDrawerController
import DZNEmptyDataSet
import JSBadgeView
import MBProgressHUD
import SCLAlertView
import SwiftSpinner
import TextFieldEffects
import DynamicButton
import SDAutoLayout
import BFPaperButton
import LTMorphingLabel
import Firebase

var drawer:MMDrawerController{
    let board = UIStoryboard(name: "Main", bundle: nil)
    let left = board.instantiateViewControllerWithIdentifier("left")
    let center = board.instantiateViewControllerWithIdentifier("center") as! UINavigationController
    let right = board.instantiateViewControllerWithIdentifier("right")
    let tabbar = center.childViewControllers.first
    tabbar?.navigationController?.navigationBarHidden = true
    
    let vc = MMDrawerController(centerViewController: center, leftDrawerViewController: left, rightDrawerViewController: right)
    vc.openDrawerGestureModeMask = .PanningCenterView
    vc.closeDrawerGestureModeMask = .PanningCenterView
    return vc
}
internal var loginVC:ViewController!
func getLoginVC()->ViewController{
    if let vc = loginVC {
        return vc
    }
    else {
        let board = UIStoryboard(name: "Main", bundle: nil)
        let vc = board.instantiateViewControllerWithIdentifier("first")
        return vc as! ViewController
    }
}

class ViewController: UIViewController {
    
    let loginButton = BFPaperButton(raised: true)
    let signupButton = BFPaperButton(raised: true)
    
    let usernameField = KaedeTextField()
    let passwordField = KaedeTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginVC = self
        titleLabel = LTMorphingLabel()
        titleLabel.text = "Blazing Vote"
        view.addSubview(titleLabel)
        titleLabel.textAlignment = .Center
        titleLabel.sd_layout()
            .topSpaceToView(view, 30)
            .leftSpaceToView(view, 20)
            .rightSpaceToView(view, 20)
            .heightIs(21)
        titleLabel.morphingEffect = .Sparkle
        
        usernameField.setup("Username", top: titleLabel, parent: view)
        passwordField.setup("Password", top: usernameField, parent: view)

        loginButton.setup("Login", top: passwordField, parent: view)
        signupButton.setup("Signup", top: loginButton, parent: view)
        
        loginButton.addTarget(self, action: #selector(ViewController.login), forControlEvents: .TouchUpInside)
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.changeTitle), userInfo: nil, repeats: true)
        
        signupButton.addTarget(self, action: #selector(signup), forControlEvents: .TouchUpInside)
        
        touchToHideKeyboard()
    }
    
    var titleLabel:LTMorphingLabel!
    
    let titleArr = ["Blazing Vote", "Welcome", "Zhenyang Zhong", "Hello World"]
    var titleState = 0
    
    func changeTitle(){
        titleState+=1
        if titleState >= titleArr.count{
            titleState = 0
        }
        titleLabel.text = titleArr[titleState]
    }
    
    func showMainView(){
        showViewController(drawer, sender: self)
    }
    
    func endSpinner(){
        
        FIRAuth.auth()?.signInWithEmail(usernameField.text!, password: passwordField.text!, completion: nil)
        FIRAuth.auth()?.signInWithEmail(usernameField.text!, password: passwordField.text!, completion: { (user, err) in
            SwiftSpinner.hide()
            if let _ = user{
                self.showMainView()
            }
        })
    }
    
    func login(){
        SwiftSpinner.show("Loading...")
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(endSpinner), userInfo: nil, repeats: false)
    }
    
    func signup(){
        //        let alert = SCLAlertView()
        //        alert.showEdit("Editing", subTitle: "Let's edit it")
        let board = UIStoryboard(name: "Main", bundle: nil)
        let vc = board.instantiateViewControllerWithIdentifier("Signup")
        showViewController(vc, sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIViewController{
    
    func touchToHideKeyboard(){
        let tab = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tab.enabled = true
        view.addGestureRecognizer(tab)
    }
    
    func hideKeyboard(){
        view.endEditing(true)
    }
}

extension KaedeTextField{
    func setup(placeholder:String, top:UIView, parent:UIView){
        parent.addSubview(self)
        self.sd_layout()
            .topSpaceToView(top, 20)
            .leftSpaceToView(parent, 20)
            .rightSpaceToView(parent, 20)
            .heightIs(40)
        self.placeholder = placeholder
        placeholderColor = UIColor.darkGrayColor()
        foregroundColor = UIColor.lightGrayColor()
    }
}

extension BFPaperButton{
    func setup(text:String, top:UIView, parent:UIView){
        parent.addSubview(self)
        sd_layout()
            .topSpaceToView(top, 20)
            .leftSpaceToView(parent, 80)
            .heightIs(40)
            .rightSpaceToView(parent, 80)
        
        setTitle(text, forState: .Normal)
        setTitle(text, forState: .Highlighted)
        backgroundColor = UIColor.lightGrayColor()
        usesSmartColor = true
    }
}
