//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Павел Анплеенко on 13/08/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
	
	var name: String
	var isComplete: Bool
	
	var subItems: [ToDoItem]
	
	var subItemstext: String {
		if subItems.count == 0 {
			return ""
		}
		
		
		//вычисляем сколько сабайтемов
		var completedTodoCount: Int = 0
		for todo in subItems {
			if todo.isComplete {
				completedTodoCount += 1
			}
		}
		
		if completedTodoCount == 0 {
			return String(subItems.count) + " subitems"
		} else {
			return String(subItems.count) + " subitems / " + String(completedTodoCount) + " complete"
	 }
		
	}
	
	
	init(name: String) {
		self.name = name
		self.isComplete = false
		self.subItems = []
	}
	
	//разворачиваем из словаря ToDoItem
	init(dictionary: NSDictionary) {
		self.name = dictionary.objectForKey("name") as! String
		self.isComplete = dictionary.objectForKey("isComplete") as! Bool
		self.subItems = []
		
		let arraySubTodos = dictionary.objectForKey("subtodos") as! NSArray
		
		for subtodoDict in arraySubTodos{
			self.subItems.append(ToDoItem(dictionary: subtodoDict as! NSDictionary))
		}
	}
	
	//получаем словарь
	var dictionary: NSDictionary{
		//позвоить сделать сколько угодно длинную вложенность
		var arraySubToDos = NSArray()
		for subitem in subItems{
			arraySubToDos = arraySubToDos.arrayByAddingObject(subitem.dictionary)
		}
		
		let dictionary = NSDictionary(objects: [name, isComplete, arraySubToDos], forKeys: ["name", "isComplete", "subtodos"])
		return dictionary
	}
	
	func addSubItem(subItem: ToDoItem){
		subItems.append(subItem)
	}
	
	//функция удаления
	func removeSubItem(index: Int) {
		subItems.removeAtIndex(index)
	}
	
	func changeState() {
		isComplete = !isComplete
	}
	
}
