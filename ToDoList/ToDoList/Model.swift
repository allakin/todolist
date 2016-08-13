//
//  Model.swift
//  ToDoList
//
//  Created by Павел Анплеенко on 13/08/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit

//путь для сохранения информации в файле
var pathForSaveData: String {
	let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.LibraryDirectory, NSSearchPathDomainMask.UserDomainMask, true) [0]+"/data.plist"
	
	 print(path)
		return path
}
var rootItem: ToDoItem?

//загружаем данный
func loadDate() {
	//проверяем есть что в этом файле
	if let dict = NSDictionary(contentsOfFile: pathForSaveData) {
		rootItem = ToDoItem(dictionary: dict)
	} else {
		rootItem = ToDoItem(name: "ToDo")
	}
}

//сохраняем данные
func saveData() {
	rootItem?.dictionary.writeToFile(pathForSaveData, atomically: true)
}

