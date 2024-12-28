//
//  FullScreen.swift
//  FindMe Watch App
//
//  Created by Cihan Yilmaz on 12/28/24.
//

import SwiftUI

struct FullScreen: View {
    
    let colors: [Color]
    let brightness: Double
    
    @Environment(\.presentationMode) var presentationMode // Handles dismiss

        var body: some View {
            TabView {
                ForEach(colors, id: \.self) { color in
                    color
                        .opacity(brightness / 3) // Adjust brightness
                        .edgesIgnoringSafeArea(.all) // Full screen
                }
            }
            .tabViewStyle(PageTabViewStyle()) // Swipeable screens for multiple colors
            .onTapGesture {
                presentationMode.wrappedValue.dismiss() // Dismiss to go back
            }
        }
    }


struct FullScreen_Previews: PreviewProvider {
    static var previews: some View {
            FullScreen(colors: [Color.red], brightness: 1.0) // Pass an array of Color
        }
}
