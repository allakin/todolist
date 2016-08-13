//
//  TableViewController.swift
//  ToDoList
//
//  Created by Павел Анплеенко on 13/08/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

	var toDoItemCurrent: ToDoItem?
	
	@IBAction func pushAddAction(sender: AnyObject) {
		
		let alert = UIAlertController(title: "Create new item", message: "", preferredStyle: .Alert)
		
		alert.addTextFieldWithConfigurationHandler { (textField) in
			textField.placeholder = "ToDo item"
		}
		//по клику добавляем значение в файл
		let alertActionCreate = UIAlertAction(title: "Create", style: .Default) { (alertAction) in
			if alert.textFields![0].text == "" {
				print("ошибка")
			} else {
				let newItem = ToDoItem(name: alert.textFields![0].text!)
				self.toDoItemCurrent?.addSubItem(newItem)
				self.tableView.reloadData()
				saveData()
			}
		}
		
		let alertActionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { (UIAlertAction) in
		}
		
		alert.addAction(alertActionCreate)
		alert.addAction(alertActionCancel)
		presentViewController(alert, animated: true, completion: nil)
		
	}
	
	
	override func viewDidLoad() {
					super.viewDidLoad()
		
		if toDoItemCurrent == nil {
			toDoItemCurrent = rootItem
		}
	}

	override func didReceiveMemoryWarning() {
					super.didReceiveMemoryWarning()
					// Dispose of any resources that can be recreated.
	}

	// MARK: - Table view data source

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
					// #warning Incomplete implementation, return the number of sections
					return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
					// #warning Incomplete implementation, return the number of rows
					return toDoItemCurrent!.subItems.count
	}


	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
		
		let itemForCell = toDoItemCurrent?.subItems[indexPath.row]
		cell.textLabel?.text = itemForCell?.name
		return cell
	}
	

	
	// Override to support conditional editing of the table view.
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}


	// удаление строки из ячейки
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {
			//удаляем строку из ячейки
			toDoItemCurrent!.removeSubItem(indexPath.row)
			saveData()
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		} else if editingStyle == .Insert {
					// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}

	/*
	// Override to support rearranging the table view.
	override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

	}
	*/

	/*
	// Override to support conditional rearranging of the table view.
	override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
					// Return false if you do not want the item to be re-orderable.
					return true
	}
	*/

	/*
	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
					// Get the new view controller using segue.destinationViewController.
					// Pass the selected object to the new view controller.
	}
	*/

}
