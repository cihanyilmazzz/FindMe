//
//  HomeScreen.swift
//  FindMe Watch App
//
//  Created by Cihan Yilmaz on 12/28/24.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject private var viewModel = ColorPickerViewModel()
    @State private var brightness : Double = 1.0
    @State private var isFullScreen = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators:true) {
                    // SELECT COLORS PART
                    Text("Select colors")
                        .font(.headline)
                        .padding()
                        
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach([Color.yellow, Color.orange, Color.red, Color.blue, Color.pink, Color.white], id: \.self) { color in
                                Button(action: {
                                    viewModel.toggleColorSelection(color) // Call the ViewModel function
                                }) {
                                    Circle()
                                        .fill(color) // Correct usage of .fill with a Color
                                        .frame(width: 40, height: 40)
                                        .overlay(
                                            viewModel.selectedColors.contains(color)
                                            ? Circle()
                                                .stroke(Color.white, lineWidth: 3) // Highlight if selected
                                            : nil
                                        )
                                }
                                .padding(2)
                                .buttonStyle(.plain)
                                
                            }
                        }
                    }
                    // BRIGHTNESS PART
                    VStack {
                        Text("Brightness: \(Int(brightness))")
                            .font(.caption)
                        
                        Slider(value: $brightness, in: 1...3, step: 1)
                            .padding()
                    }
                    .offset(y:10)
                    
                    // START BUTTON
                   
                    NavigationLink(destination: FullScreenView(colors: viewModel.selectedColors, brightness: brightness)) {
                        Text("Start")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                           
                    }
                    .buttonStyle(.plain)
                    .offset(y:10)
                    
                }
                
                
               
               
            }
            
        }
        
    }
    
    struct HomeScreenView_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreenView()
        }
    }
}
