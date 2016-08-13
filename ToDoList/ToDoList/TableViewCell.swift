//
//  TableViewCell.swift
//  ToDoList
//
//  Created by Павел Анплеенко on 13/08/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

	@IBOutlet weak var buttonChek: UIButton!
	
	@IBAction func pushChekAction(sender: AnyObject) {
	}
	
	@IBOutlet weak var labelName: UILabel!
	
	@IBOutlet weak var labelSubItems: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
