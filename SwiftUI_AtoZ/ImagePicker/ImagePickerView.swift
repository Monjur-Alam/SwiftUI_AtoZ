//
//  ImagePickerView.swift
//  SwiftUI_AtoZ
//
//  Created by MacBook Pro on 26/7/23.
//

import SwiftUI

struct ImagePickerView: View {

    @State private var currentImage : UIImage = UIImage(named: "placeholder") ?? UIImage()
    @State private var showPhotoLibrary : Bool = false
    @State private var showShareSheet : Bool = false
    
    var body: some View {
        
        VStack {
            
            Image(uiImage: currentImage).resizable()
                .scaledToFit()
                .foregroundColor(.gray)
                .padding(20)
            
            HStack {
                Button("Select Image") {
                    // show photo gallery
                    showPhotoLibrary.toggle()
                }
                .sheet(isPresented: $showPhotoLibrary, content: {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $currentImage)
                })

                Spacer()

                Button("Share") {
                    // show the share options
                    showShareSheet.toggle()
                }

                .sheet(isPresented: $showShareSheet, content: {
                    ShareSheet(contents: [currentImage])
                })
            }
            .padding(20)
            .navigationBarTitle("Image Picker", displayMode: .inline)
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
