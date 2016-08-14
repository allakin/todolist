//
//  FirstViewController.swift
//  Tabbed Aplication
//
//  Created by Павел Анплеенко on 14/08/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tb1Tasks: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tb1Tasks.reloadData()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		tb1Tasks.reloadData()
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return taskMgr.tasks.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default Tasks")
		cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
		cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
		return cell
	}

	//удаление ячейки с перезагрузкой tb1Tasks
	func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if (editingStyle == UITableViewCellEditingStyle.Delete){
			taskMgr.tasks.removeAtIndex(indexPath.row)
			tb1Tasks.reloadData()
		}
	}

}

