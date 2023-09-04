//
//  ProgressView.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 8/8/23.
//

import SwiftUI
//import PlaygroundSupport

struct ProgressView: View {
  @State var value: Int
  var maximum: Int = 7
  var height: CGFloat = 10
  var spacing: CGFloat = 2
  var selectedColor: Color = .accentColor
  var unselectedColor: Color = Color.secondary.opacity(0.3)

  var body: some View {
    HStack(spacing: spacing) {
      ForEach(0 ..< maximum) { index in
        Capsule()
          .foregroundColor(index < self.value ? self.selectedColor : self.unselectedColor)
          .onTapGesture {
              value = index + 1
          }
      }
    }
    .frame(maxHeight: height)
//    .clipShape(Capsule())
  }
}

struct ExampleOfProgress: View {
  @State var value = 0
  var maximum = 10

  var body: some View {
    VStack(alignment: .leading) {
      Text("SegmentedProgressView example")
        .font(.headline)
      Text("Current value is \(value) out of \(maximum)")
        .font(.body)
//      SegmentedProgressView(value: value, maximum: maximum)
//        .animation(.default)
//        .padding(.vertical)
      Button(action: {
        self.value = (self.value + 1) % (self.maximum + 1)
      }) {
        Text("Increment value")
      }
    }
    .padding()
  }
}

//PlaygroundPage.current.liveView = UIHostingController(rootView: ExampleOfProgress())
