//
//  ColorPickerViewModel.swift
//  FindMe Watch App
//
//  Created by Cihan Yilmaz on 12/28/24.
//

import SwiftUI

class ColorPickerViewModel: ObservableObject {
    @Published var selectedColors: [Color] = []

    func toggleColorSelection(_ color: Color) {
        if let index = selectedColors.firstIndex(of: color) {
            selectedColors.remove(at: index) // Deselect color
        } else {
            selectedColors.append(color) // Select color
        }
    }
}



