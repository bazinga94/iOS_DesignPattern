//
//  AbstractFactoryPattern.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/27.
//

import UIKit

// 출처: https://gaki2745.github.io/ios/2020/04/12/iOS-DesignPattern-05/

protocol PizzaStoreProtocol {
	func createPizza(_ type: String) -> Pizza?
	func orderPizza()
	func deliveryPizza()
}

class NewyorkCheesePizza: Pizza {
}

class NewyorkPepperoniPizza: Pizza {
}

class ChicagoCheesePizza: Pizza {
}

class ChicagoPepperoniPizza: Pizza {
}

class NewyorkPizzaStore: PizzaStoreProtocol {
	func createPizza(_ type: String) -> Pizza? {
		var pizza: Pizza?
		switch type {
			case "cheese":
				pizza = NewyorkCheesePizza()
			case "Peperoni":
				pizza = NewyorkPepperoniPizza()
			default:
				pizza = nil
		}
		return pizza
	}

	func orderPizza() { }
	func deliveryPizza() { }
}

class ChicagoPizzaStore: PizzaStoreProtocol {

	func createPizza(_ type: String) -> Pizza? {
		var pizza: Pizza?
		switch type {
			case "cheese":
				pizza = ChicagoCheesePizza()
			case "Peperoni":
				pizza = ChicagoPepperoniPizza()
			default:
				pizza = nil
		}
		return pizza
	}

	func orderPizza() { }
	func deliveryPizza() { }
}

protocol ButtonProtocol {
	func setTitle(_ title: String) -> Void
	func show() -> Void
}

protocol LabelProtocol {
	func setTitle(_ title: String) -> Void
	func show() -> Void
}

protocol AbstractGUIFactory {
	func createButton() -> ButtonProtocol
	func createLabel() -> LabelProtocol
}

class AppleButton: ButtonProtocol {
	func setTitle(_ title: String) {
		print("Apple Button set title \(title)")
	}

	func show() {
		print("Apple Button show")
	}
}

class GoogleButton: ButtonProtocol {
	func setTitle(_ title: String) {
		print("Google Button set title \(title)")
	}

	func show() {
		print("Google Button show")
	}
}

class AppleLabel: LabelProtocol {
	func setTitle(_ title: String) {
		print("Apple Label set title \(title)")
	}

	func show() {
		print("Apple Label show")
	}
}

class GoogleLabel: LabelProtocol {
	func setTitle(_ title: String) {
		print("Google Label set title \(title)")
	}

	func show() {
		print("Google Label show")
	}
}

class AppleFactory : AbstractGUIFactory {
	func createButton() -> ButtonProtocol {
		return AppleButton()
	}

	func createLabel() -> LabelProtocol {
		return AppleLabel()
	}
}

class GoogleFactory : AbstractGUIFactory {
	func createButton() -> ButtonProtocol {
		return GoogleButton()
	}

	func createLabel() -> LabelProtocol {
		return GoogleLabel()
	}
}

class GUIBuilder {
	private var platform: String
	private var guiFactory: AbstractGUIFactory?

	init(platform: String) {
		self.platform = platform
	}

	func initGuiFactory() -> Void {
		if guiFactory != nil { return }
		switch platform {
			case "apple":
				guiFactory = AppleFactory()
			case "google":
				guiFactory = GoogleFactory()
			default:
				guiFactory = nil
		}
	}

	func buildButton() -> ButtonProtocol? {
		initGuiFactory()
		if let button = guiFactory?.createButton() {
			return button
		} else {
			return nil
		}
	}

	func buildLabel() -> LabelProtocol? {
		initGuiFactory()
		if let label = guiFactory?.createLabel() {
			return label
		} else {
			return nil
		}
	}
}

