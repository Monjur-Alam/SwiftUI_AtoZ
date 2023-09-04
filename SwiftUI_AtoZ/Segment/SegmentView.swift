//
//  SegmentView.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 25/8/23.
//

import SwiftUI

struct SegmentView: View {
    @State private var preselectedIndex = 0
    @State private var customPreselectedIndex = 0
    @State private var selectedSegment = 0
    @State private var cities = ["Berlin", "Munich", "Hamburg"]
    
    @State var selectedIndex: Int = 7
    let titles: [String] =
        ["First",
         "Second",
         "Third",
         "Fourth",
         "Fifth",
         "Sixth",
         "Seventh",
         "Eighth",
         "Ninth",
         "Tenth",
         "Eleventh",
         "Twelfth",
         "Thirteenth",
         "Fourteenth",
         "Fifteenth",
         "Sixteenth",
         "Seventeenth",
         "Eighteenth",
         "Nineteenth",
         "Tweentieth"
        ]
    
    var body: some View {
        VStack {
            Picker("City", selection: $preselectedIndex) {
                ForEach(0..<cities.count) { index in
                    Text(cities[index])
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer().frame(height: 20)
            
            CustomSegmentedControl(preselectedIndex: $customPreselectedIndex, options: ["Berlin", "Munich", "Hamburg"])
            
            Spacer().frame(height: 20)
            
            AnotherCustomSegmentedControl(
                selectedSegment: $selectedSegment,
                segments: ["Segment 1", "Segment 2", "Segment 3"]
            )
            
            SegmentedControlView(selectedIndex: $selectedIndex, titles: titles)
        }
        .padding(.horizontal, 20)
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView()
    }
}

struct SegmentedControlView: View {
    @Binding private var selectedIndex: Int

    @State private var frames: Array<CGRect>
    @State private var backgroundFrame = CGRect.zero
    @State private var isScrollable = true

    private let titles: [String]

    init(selectedIndex: Binding<Int>, titles: [String]) {
        self._selectedIndex = selectedIndex
        self.titles = titles
        frames = Array<CGRect>(repeating: .zero, count: titles.count)
    }

    var body: some View {
        VStack {
            if isScrollable {
                ScrollView(.horizontal, showsIndicators: false) {
                    SegmentedControlButtonView(selectedIndex: $selectedIndex, frames: $frames, backgroundFrame: $backgroundFrame, isScrollable: $isScrollable, checkIsScrollable: checkIsScrollable, titles: titles)
                }
            } else {
                SegmentedControlButtonView(selectedIndex: $selectedIndex, frames: $frames, backgroundFrame: $backgroundFrame, isScrollable: $isScrollable, checkIsScrollable: checkIsScrollable, titles: titles)
            }
        }
        .background(
            GeometryReader { geoReader in
                Color.clear.preference(key: RectPreferenceKey.self, value: geoReader.frame(in: .global))
                    .onPreferenceChange(RectPreferenceKey.self) {
                    self.setBackgroundFrame(frame: $0)
                }
            }
        )
    }

    private func setBackgroundFrame(frame: CGRect)
    {
        backgroundFrame = frame
        checkIsScrollable()
    }

    private func checkIsScrollable()
    {
        if frames[frames.count - 1].width > .zero
        {
            var width = CGFloat.zero

            for frame in frames
            {
                width += frame.width
            }

            if isScrollable && width <= backgroundFrame.width
            {
                isScrollable = false
            }
            else if !isScrollable && width > backgroundFrame.width
            {
                isScrollable = true
            }
        }
    }
}

private struct SegmentedControlButtonView: View {
    @Binding private var selectedIndex: Int
    @Binding private var frames: [CGRect]
    @Binding private var backgroundFrame: CGRect
    @Binding private var isScrollable: Bool

    private let titles: [String]
    let checkIsScrollable: (() -> Void)

    init(selectedIndex: Binding<Int>, frames: Binding<[CGRect]>, backgroundFrame: Binding<CGRect>, isScrollable: Binding<Bool>, checkIsScrollable: (@escaping () -> Void), titles: [String])
    {
        _selectedIndex = selectedIndex
        _frames = frames
        _backgroundFrame = backgroundFrame
        _isScrollable = isScrollable

        self.checkIsScrollable = checkIsScrollable
        self.titles = titles
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(titles.indices, id: \.self) { index in
                Button(action:{ selectedIndex = index })
                {
                    HStack {
                        Text(titles[index])
                            .frame(height: 42)
                    }
                }
                .buttonStyle(CustomSegmentButtonStyle())
                .background(
                    GeometryReader { geoReader in
                        Color.clear.preference(key: RectPreferenceKey.self, value: geoReader.frame(in: .global))
                            .onPreferenceChange(RectPreferenceKey.self) {
                                self.setFrame(index: index, frame: $0)
                            }
                    }
                )
            }
        }
        .modifier(UnderlineModifier(selectedIndex: selectedIndex, frames: frames))
    }

    private func setFrame(index: Int, frame: CGRect) {
        self.frames[index] = frame

        checkIsScrollable()
    }
}

private struct CustomSegmentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
            .background(configuration.isPressed ? Color(red: 0.808, green: 0.831, blue: 0.855, opacity: 0.5): Color.clear)
    }
}

struct RectPreferenceKey: PreferenceKey {
    typealias Value = CGRect

    static var defaultValue = CGRect.zero

    static func reduce(value: inout CGRect, nextValue: () -> CGRect)
    {
        value = nextValue()
    }
}

struct UnderlineModifier: ViewModifier {
    var selectedIndex: Int
    let frames: [CGRect]

    func body(content: Content) -> some View {
        content
            .background(
                Rectangle()
                    .fill(Color.red)
                    .frame(width: frames[selectedIndex].width, height: 2)
                    .offset(x: frames[selectedIndex].minX - frames[0].minX), alignment: .bottomLeading
            )
            .background(
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1), alignment: .bottomLeading
            )
            .animation(_: .default, value: 1)
    }
}

struct CustomSegmentedControl: View {
    @Binding var preselectedIndex: Int
    var options: [String]
    let color = Color.red
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                let isSelected = preselectedIndex == index
                ZStack {
                    Rectangle()
                        .fill(color.opacity(0.2))
                    
                    Rectangle()
                        .fill(color)
                        .cornerRadius(20)
                        .padding(2)
                        .opacity(isSelected ? 1 : 0.01)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.2,
                                                             dampingFraction: 2,
                                                             blendDuration: 0.5)) {
                                preselectedIndex = index
                            }
                        }
                }
                .overlay(
                    Text(options[index])
                        .fontWeight(isSelected ? .bold : .regular)
                        .foregroundColor(isSelected ? .black : .gray)
                )
            }
        }
        .frame(height: 40)
        .cornerRadius(20)
    }
}

struct AnotherCustomSegmentedControl: View {
    @Binding var selectedSegment: Int
    var segments: [String]
    let color = Color.red

    var body: some View {
        HStack(spacing: 10) {
            ForEach(segments.indices, id:\.self) { index in
                Button(action: {
                    withAnimation(.interactiveSpring()) {
                        selectedSegment = index
                    }
                }) {
                    Text(segments[index])
                        .font(.system(size: 12))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(color.opacity(0.8))
                        .cornerRadius(10)
                }
                .foregroundColor(.white)
                .opacity(selectedSegment == index ? 1 : 0.5)
            }
        }
    }
}

