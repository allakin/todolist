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
	
	init(name: String) {
		self.name = name
		self.isComplete = false
		self.subItems = []
	}
	
	
	func addSubItem(subItem: ToDoItem){
		subItems.append(subItem)
	}
	
}
