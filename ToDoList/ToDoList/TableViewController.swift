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
	
	// MARK: - pushAddAction button
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
	
	// MARK: - viewDidLoad
	override func viewDidLoad() {
					super.viewDidLoad()
		if toDoItemCurrent == nil {
			toDoItemCurrent = rootItem
		}
		
		//отображение в проваленном списке заголовок категории
		navigationItem.title = toDoItemCurrent?.name
		
		//метод при долгом нажитии на ячейку чтобы появился алерт
		let longPressedGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
		tableView.addGestureRecognizer(longPressedGestureRecognizer)
		//минимальное время через которое сработает действие
		longPressedGestureRecognizer.minimumPressDuration = 0.5
	}
	
	func handleLongPress(longPress: UILongPressGestureRecognizer) {
		
		// координаты точки нажатие во view contoller
		let pointOfTouch = longPress.locationInView(tableView)
		
		//получение indexPath той ячейки которой коснулись
		let indexPath = tableView.indexPathForRowAtPoint(pointOfTouch)
		
		//проверить состояние
		if longPress.state == .Began {
			if let indexPath = indexPath {
				let toDoItem = toDoItemCurrent?.subItems[indexPath.row]
				
				let alert = UIAlertController(title: "Edit item", message: "", preferredStyle: .Alert)
				
				alert.addTextFieldWithConfigurationHandler { (textField) in
					textField.placeholder = "ToDo item"
					textField.text = toDoItem?.name
				}
				//по клику добавляем значение в файл
				let alertActionCreate = UIAlertAction(title: "Update", style: .Default) { (alertAction) in
					if alert.textFields![0].text! == "" {
						print("ошибка")
					} else {
						toDoItem?.name = alert.textFields![0].text!
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
		}
		
	}
	
	// MARK: - didReceiveMemoryWarning
	override func didReceiveMemoryWarning() {
					super.didReceiveMemoryWarning()
					// Dispose of any resources that can be recreated.
	}
	
	// MARK: - viewWillAppear
	// обновления информации в ячейках
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}

	// MARK: - numberOfSectionsInTableView
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
					// #warning Incomplete implementation, return the number of sections
					return 1
	}

	// MARK: - numberOfRowsInSection
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
					// #warning Incomplete implementation, return the number of rows
					return toDoItemCurrent!.subItems.count
	}

 // MARK: - cellForRowAtIndexPath
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
		
		let itemForCell = toDoItemCurrent?.subItems[indexPath.row]
		cell.textLabel?.text = itemForCell!.name
		
		//отображение количества items в ячейке
		if itemForCell!.subItems.count != 0 {
			cell.detailTextLabel?.text = String(itemForCell!.subItems.count)+" subitems"
		} else {
			cell.detailTextLabel?.text = ""
		}
		
		return cell
	}
	
	// MARK: - canEditRowAtIndexPath
	// Override to support conditional editing of the table view.
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}

	// MARK: - commitEditingStyle
	// удаление строки из ячейки
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {
			//удаляем строку из ячейки
			toDoItemCurrent!.removeSubItem(indexPath.row)
			//сохраняем данные
			saveData()
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		} else if editingStyle == .Insert {
					// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
	
	// MARK: - didSelectRowAtIndexPath
	//проваливаемся в ячейку для отображения доп инфы
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let subItem = toDoItemCurrent?.subItems[indexPath.row]
		let tvc = storyboard?.instantiateViewControllerWithIdentifier("todoSID") as! TableViewController
		//выбранный в данный момент subitem
		tvc.toDoItemCurrent = subItem
		
		//помещаем в навигейшен контроллер
		navigationController?.pushViewController(tvc, animated: true)
		
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
