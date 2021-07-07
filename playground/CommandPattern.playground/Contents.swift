import Foundation

// http://throughkim.kr/2019/09/06/swift-command/ 참고

// MARK: - AS-IS

//class Lamp {
//	func turnOn() {
//		print("Lamp On")
//	}
//}
//
//class Button {
//	private let lamp: Lamp
//
//	init(lamp: Lamp) {
//		self.lamp = lamp
//	}
//
//	func pressed() {
//		self.lamp.turnOn()
//	}
//}
//
//let lamp = Lamp()
//let lampButton = Button(lamp: lamp)
//lampButton.pressed()                // Lamp On


// MARK: - TO-BE

protocol Command {
	func execute()
}

class Button {
	private var command: Command

	init(command: Command) {
		self.command = command
	}

	func setCommand(command: Command) {
		self.command = command
	}

	func pressed() {
		self.command.execute()
	}
}

class Lamp {
	func turnOn() {
		print("Lamp On")
	}
}

class LampOnCommand: Command {
	private var lamp: Lamp

	init(lamp: Lamp) {
		self.lamp = lamp
	}

	func execute() {
		self.lamp.turnOn()
	}

}

class Alarm {
	func start() {
		print("Alarm Start")
	}
}

class AlarmStartCommand: Command {
	private var alarm: Alarm

	init(alarm: Alarm) {
		self.alarm = alarm
	}

	func execute() {
		self.alarm.start()
	}
}

let lamp = Lamp()
let lampOnCommand = LampOnCommand(lamp: lamp)
let alarm = Alarm()
let alarmStartCommand = AlarmStartCommand(alarm: alarm)

// 램프를 켜는 버튼
let button1 = Button(command: lampOnCommand)
button1.pressed()                               // Lamp On

// 한 번 누르면 알람이 켜지고 두 번 누르면 램프가 켜지는 버튼
let button2 = Button(command: alarmStartCommand)
button2.pressed()                               // Alarm Start
button2.setCommand(command: lampOnCommand)
button2.pressed()                               // Lamp On
