//
//  CachedDateFormatter.swift
//  CachedDateFormatter
//
//  Created by Benni on 06.03.17.
//  Copyright © 2017 Ben Böcker. All rights reserved.
//

import Foundation


import Foundation

class CachedDateFormatter {
	static let shared = CachedDateFormatter()
	
	fileprivate var customDateFormatters: [Int: DateFormatter] = [:]
	
	private init() {}
}

/// Public methods
extension CachedDateFormatter {
	func string(from date: Date, dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
		let combinedHashValue = "\(dateStyle.rawValue)\(timeStyle.rawValue)".hashValue
		
		if let dateFormatter = customDateFormatters[combinedHashValue] {
			return dateFormatter.string(from: date)
		} else {
			let dateFormatter = DateFormatter()
			dateFormatter.dateStyle = dateStyle
			dateFormatter.timeStyle = timeStyle
			customDateFormatters[combinedHashValue] = dateFormatter
			
			return dateFormatter.string(from: date)
		}
	}
	
	func string(from date: Date, with format: String) -> String {
		let hashValue = format.hashValue
		
		if let dateFormatter = customDateFormatters[hashValue] {
			return dateFormatter.string(from: date)
		} else {
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = format
			customDateFormatters[hashValue] = dateFormatter
			
			return dateFormatter.string(from: date)
		}
	}
}


