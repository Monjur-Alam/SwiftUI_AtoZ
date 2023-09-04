//
//  DatePickerVM.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 25/7/23.
//

import Foundation

class DatePickerVM: ObservableObject {
    let now = Date.now
    let fmt = ISO8601DateFormatter()
    
    let tomorrow = Date().dayAfter
    let yesterday = Date().dayBefore
    
    @Published var selectedDate = Date()
    func dateCompare() -> String {
        print("\(selectedDate)")
        if Calendar.current.isDate(now, equalTo: selectedDate, toGranularity: .minute) {
            return "Current date"
        } else if selectedDate >= now {
            return "Next date"
        } else if selectedDate <= now {
            return "Previous date"
        } else {
            return "Invalid date"
        }
    }
}

extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .minute, value: 1, to: self)!
    }

    var dayBefore: Date {
        return Calendar.current.date(byAdding: .minute, value: -1, to: self)!
    }
}
