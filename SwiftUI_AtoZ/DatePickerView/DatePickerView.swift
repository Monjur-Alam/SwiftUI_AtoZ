//
//  DatePickerView.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 24/7/23.
//

import SwiftUI

struct DatePickerView: View {
    @StateObject var viewModel = DatePickerVM()
    var body: some View {
        Form {
            DatePicker("Select event date and time", selection: $viewModel.selectedDate, displayedComponents: [.date, .hourAndMinute])
            
            Text("\(viewModel.dateCompare())")
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
