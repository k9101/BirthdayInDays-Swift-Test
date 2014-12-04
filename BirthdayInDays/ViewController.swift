//
//  ViewController.swift
//  BirthdayInDays
//
//  Created by Kris Penney on 2014-12-03.
//  Copyright (c) 2014 Kris Penney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var outputLabel: UILabel!
	
	
	@IBOutlet weak var theDate: UIDatePicker!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		theDate.maximumDate = NSDate()
		theDate.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
		// Do any additional set up after loading the view, typically from a nib.
	}

	
	func datePickerChanged(datePicker:UIDatePicker){
		var dateFormatter = NSDateFormatter()
		dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
		
		var calander = NSCalendar(identifier: NSGregorianCalendar)

		var currentDate = NSDate()
		var durationDateComponents = calander?.components(NSCalendarUnit.CalendarUnitDay,
			fromDate: theDate.date,
			toDate: currentDate,
			options: nil)
		
		var numberOfDaysAlive = durationDateComponents?.day
		
		//format with commas
		var numberFormatter = NSNumberFormatter();
		numberFormatter.usesGroupingSeparator = true
		
		var dayString = numberFormatter.stringFromNumber(numberOfDaysAlive!)
		
		outputLabel.text = "You have been alive for: \(dayString) days"
	}
	
}

