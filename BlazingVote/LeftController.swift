//
//  LeftController.swift
//  BlazingVote
//
//  Created by 钟镇阳 on 5/18/16.
//  Copyright © 2016 ZhenyangZhong. All rights reserved.
//

import UIKit

class LeftController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var profilePicture: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profilePicture.layer.cornerRadius = 64
        
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.selected = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var tagsArr = ["Science", "Recreation", "Technology", "Foods", "Soccer", "Piano", "Billiards", "Magic Cube"]

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tagsArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = tagsArr[indexPath.row]
        return cell
    }
}
