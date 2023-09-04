//
//  ShareSheet.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 26/7/23.
//

import Foundation
import SwiftUI

struct ShareSheet : UIViewControllerRepresentable  {

    var contents : [Any] = []

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: contents, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }

    typealias UIViewControllerType = UIActivityViewController

}
