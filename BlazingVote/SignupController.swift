
//
//  SignupController.swift
//  BlazingVote
//
//  Created by 钟镇阳 on 5/18/16.
//  Copyright © 2016 ZhenyangZhong. All rights reserved.
//

import UIKit
import TextFieldEffects
import DynamicButton
import LTMorphingLabel
import BFPaperButton

class SignupController: UIViewController, LLSwitchDelegate {
    
    var backButton:DynamicButton!
    var genderLabel:LTMorphingLabel!
    var genderSwitch:LLSwitch!
    var confirmButton:BFPaperButton!
    
    func back(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didTapLLSwitch(llSwitch: LLSwitch!) {
        if !llSwitch.on {
            genderLabel.text = "Female"
        }
        else {
            genderLabel.text = "Male"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton = DynamicButton(style: DynamicButtonStyle.Close)
        view.addSubview(backButton)
        backButton.sd_layout()
            .topSpaceToView(view, 20)
            .leftSpaceToView(view, 20)
            .widthIs(20)
            .heightIs(20)
        backButton.addTarget(self, action: #selector(back), forControlEvents: .TouchUpInside)
        
        let title = UILabel()
        title.text = "Signup"
        view.addSubview(title)
        title.textAlignment = .Center
        title.sd_layout()
            .topSpaceToView(view, 40)
            .leftSpaceToView(view, 20)
            .rightSpaceToView(view, 20)
            .heightIs(21)
        // Do any additional setup after loading the view.
        
        let usernameField = KaedeTextField()
        usernameField.setup("Username", top: title, parent: view)
        
        let passwordField = KaedeTextField()
        passwordField.setup("Password", top: usernameField, parent: view)
        
        let emailField = KaedeTextField()
        emailField.setup("Email", top: passwordField, parent: view)
        
        let birthLabel = UILabel()
        birthLabel.text = "Birthday"
        view.addSubview(birthLabel)
        birthLabel.sd_layout()
            .topSpaceToView(emailField, 20)
            .leftSpaceToView(view, 20)
            .rightSpaceToView(view, 20)
            .heightIs(21)
        
        let birthPicker = UIDatePicker()
        birthPicker.datePickerMode = .Date
        view.addSubview(birthPicker)
        birthPicker.sd_layout()
            .topSpaceToView(birthLabel, 10)
            .leftSpaceToView(view, 20)
            .rightSpaceToView(view, 20)
            .heightIs(40)
        
        touchToHideKeyboard()
        
        genderLabel = LTMorphingLabel()
        genderLabel.morphingEffect = .Sparkle
        genderLabel.text = "Male"
        view.addSubview(genderLabel)
        genderLabel.sd_layout()
            .topSpaceToView(birthPicker, 20)
            .leftSpaceToView(view, 20)
            .widthIs(100)
            .heightIs(30)
        
        genderSwitch = LLSwitch(frame: CGRectMake(100, 100, 60, 30))
        view.addSubview(genderSwitch)
        genderSwitch.sd_layout()
            .topEqualToView(genderLabel)
            .heightRatioToView(genderLabel, 1)
            .rightSpaceToView(view, 0)
            .widthIs(100)
        genderSwitch.offColor = UIColor.blueColor()
        genderSwitch.onColor = UIColor.redColor()
        genderSwitch.faceColor = UIColor.whiteColor()
        genderSwitch.animationDuration = 1.2
        genderSwitch.delegate = self
        
        confirmButton = BFPaperButton(raised: true)
        confirmButton.setup("Confirm", top: genderLabel, parent: view)
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
