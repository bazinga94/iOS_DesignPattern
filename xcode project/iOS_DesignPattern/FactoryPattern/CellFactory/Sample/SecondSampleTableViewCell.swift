//
//  SecondSampleTableViewCell.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/08/19.
//

import UIKit

class SecondSampleTableViewCell: UITableViewCell {

	@IBOutlet weak var secondLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		// Configure the view for the selected state
	}
}
