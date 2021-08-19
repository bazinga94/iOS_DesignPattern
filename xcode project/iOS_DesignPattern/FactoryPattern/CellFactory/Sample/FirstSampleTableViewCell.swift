//
//  FirstSampleTableViewCell.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/08/19.
//

import UIKit

class FirstSampleTableViewCell: UITableViewCell {

	@IBOutlet weak var firstLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		// Configure the view for the selected state
	}
}

struct FirstCellItem {
	var firstLabel: String
}

class FirstSampleTableViewCellController: GenericCellController<FirstSampleTableViewCell> {
	private let item: FirstCellItem

	init(item: FirstCellItem) {
		self.item = item
	}

	override func configureCell(_ cell: FirstSampleTableViewCell) {
		cell.firstLabel.text = item.firstLabel
	}

	override func didSelectCell(itemAt indexPath: IndexPath) {
		print("\(item.firstLabel) did selected!")
	}
}
