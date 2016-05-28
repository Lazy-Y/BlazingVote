//
//  RightController.swift
//  BlazingVote
//
//  Created by 钟镇阳 on 5/18/16.
//  Copyright © 2016 ZhenyangZhong. All rights reserved.
//

import UIKit
import BFPaperButton

class RightController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func logoutAction(){
        dismissViewControllerAnimated(false, completion: nil)
    }
    
    var funcArr = ["Edit Profile", "Setting", "Description", "Team Info"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return funcArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell()
        cell.textLabel?.text = funcArr[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.selected = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logout = BFPaperButton(raised: true)
        logout.setup("Log out", top: view, parent: view)
        logout.sd_layout()
            .bottomSpaceToView(view, 20)
            .heightIs(40)
        logout.backgroundColor = UIColor.redColor()
        logout.addTarget(self, action: #selector(logoutAction), forControlEvents: .TouchUpInside)
        
        // Do any additional setup after loading the view.
        let table = UITableView()
        view.addSubview(table)
        table.sd_layout()
            .leftSpaceToView(view, 0)
            .rightSpaceToView(view, 0)
            .topSpaceToView(view, 20)
            .bottomSpaceToView(logout, 20)
        table.delegate = self
        table.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
