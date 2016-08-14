//
//  TaskManager.swift
//  Tabbed Aplication
//
//  Created by Павел Анплеенко on 14/08/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

// MARK: - struct task
// структура с двумя свойствами, которые будут собирать данные
// из наших текствовых полей
struct task {
	var name = "Name"
	var desc = "Description"
}

// MARK: - TaskManager
// добавили массив который будет хранить имя задачи и описание,
// чтобы проще было работать с ведденными данными
class TaskManager: NSObject {
	var tasks = [task]()
	
	func addTask(name: String, desc: String) {
		tasks.append(task(name: name, desc: desc))
	}
}
