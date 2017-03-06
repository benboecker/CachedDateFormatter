//
//  ViewController.swift
//  CachedDateFormatter
//
//  Created by Benni on 06.03.17.
//  Copyright © 2017 Ben Böcker. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

	var dates: [Date] = []
	@IBOutlet weak var dateFormatSegmentedControl: UISegmentedControl!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		for _ in 0...100 {
			dates.append(Date(timeIntervalSinceNow: Double(arc4random_uniform(1000000))))
		}
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dates.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		let date = dates[indexPath.row]
		let dateString: String
		
		switch (dateFormatSegmentedControl.selectedSegmentIndex) {
		case 0: dateString = CachedDateFormatter.shared.string(from: date, dateStyle: .short, timeStyle: .short)
		case 1: dateString = CachedDateFormatter.shared.string(from: date, dateStyle: .medium, timeStyle: .medium)
		case 2: dateString = CachedDateFormatter.shared.string(from: date, dateStyle: .long, timeStyle: .long)
		case 3: dateString = CachedDateFormatter.shared.string(from: date, dateStyle: .full, timeStyle: .full)
		case 4: dateString = CachedDateFormatter.shared.string(from: date, with: "EEEE, dd. MMMM — HH:mm")
		default: dateString = ""
		}
		
		cell.textLabel?.text = dateString
		
		return cell
	}
	
	@IBAction func switchFormatterMode(_ sender: Any) {
		tableView.reloadData()
	}
}

