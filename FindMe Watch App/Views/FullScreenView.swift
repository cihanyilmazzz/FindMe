//
//  FullScreen.swift
//  FindMe Watch App
//
//  Created by Cihan Yilmaz on 12/28/24.
//

import SwiftUI

struct FullScreenView: View {
    let colors: [Color]
    let brightness: Double

    @StateObject private var viewModel = FullScreenViewModel() // Attach ViewModel
    @Environment(\.presentationMode) var presentationMode // For dismissing the view

    var body: some View {
        ZStack {
            if colors.isEmpty {
                Text("No colors selected")
                    .font(.headline)
                    .foregroundColor(.gray)
            } else {
                colors[viewModel.currentIndex]
                    .opacity(brightness / 3) // Apply brightness
                    .edgesIgnoringSafeArea(.all) // Full screen
            }
        }
        .onAppear {
            viewModel.startFlashingColors(colorsCount: colors.count)
        }
        .onDisappear {
            viewModel.stopFlashingColors()
        }
        .onTapGesture {
            viewModel.stopFlashingColors()
            presentationMode.wrappedValue.dismiss() // Go back to menu
        }
    }
}

 
 struct FullScreen_Previews: PreviewProvider {
 static var previews: some View {
 FullScreenView(colors: [Color.red], brightness: 1.0) // Pass an array of Color
 FullScreenView(colors: [Color.blue], brightness: 1.0) // Pass an array of Color
 }
 
 }
 

