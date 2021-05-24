//
//  SampleViewModel.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/24.
//

import Foundation

protocol SampleViewModelProtocol {
	func changeText(with text: String)
}

class SampleViewModel: SampleViewModelProtocol {
	var sampleModel: Dynamic<SampleModel> = .init(.init(text: ""))

	init(model: SampleModel) {
		sampleModel.value = model
	}

	func changeText(with text: String) {
		sampleModel.value.text = text
	}
}
