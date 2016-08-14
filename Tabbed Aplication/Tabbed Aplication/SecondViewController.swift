//
//  SecondViewController.swift
//  Tabbed Aplication
//
//  Created by Павел Анплеенко on 14/08/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var txtTask: UITextField!
	@IBOutlet weak var txtDesc: UITextField!
	
	@IBAction func btnAddTask(sender: UIButton){
		// запись
		taskMgr.addTask(txtTask.text!, desc: txtDesc.text!)
		self.view.endEditing(true)
		txtTask.text = ""
		txtDesc.text = ""
		self.tabBarController?.selectedIndex = 0
	}
	
//	override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
//		self.view.endEditing(true)
//	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

