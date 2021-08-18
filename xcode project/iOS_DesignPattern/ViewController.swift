//
//  ViewController.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/21.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func goObserverPattern(_ sender: Any) {
		let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ObserverPatternViewController")
		self.navigationController?.pushViewController(viewController, animated: true)
	}

	@IBAction func goMVVM(_ sender: Any) {
		let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SampleViewController")
		self.navigationController?.pushViewController(viewController, animated: true)
	}


	@IBAction func executeFactoryPatternExample(_ sender: Any) {

		// 기존 인스턴스 생성
		let pizza1 = orderPizza("Cheese")
		print()
		print("-----------")
		print()

		// 팩토리 메소드 패턴
		let pizzaFactory = SimplePizzaFactory()
		let pizzaStore = PizzaStore(factory: pizzaFactory)
		let pizza2 = pizzaStore.orderPizza("Cheese")
		print()
		print("-----------")
		print()

		// 추상 팩토리 패턴 (1)
		let pizzaStoreBuilder = PizzaStoreBuilder(style: "newyork")
		let pizza3 = pizzaStoreBuilder.orderPizza(type: "Peperoni")
		print()
		print("-----------")
		print()

		// 추상 팩토리 패턴 (2)
		let guiBuilder: GUIBuilder = GUIBuilder(platform: "Apple")

		let label: LabelProtocol = guiBuilder.buildLabel()!
		label.setTitle("label title")
		label.show()

		let button: ButtonProtocol = guiBuilder.buildButton()!
		button.setTitle("button title")
		button.show()
	}

	@IBAction func goCellFactory(_ sender: Any) {
		let viewController = CellFactoryViewController()
		self.navigationController?.pushViewController(viewController, animated: true)
	}
}

