//
//  FullScreenView.swift
//  FindMe Watch App
//
//  Created by Cihan Yilmaz on 12/28/24.
//

import SwiftUI

class FullScreenViewModel: ObservableObject {
    @Published var currentIndex = 0
    private var timer: Timer? = nil

    func startFlashingColors(colorsCount: Int) {
        guard colorsCount > 1 else { return } // No need to flash if only one color
        stopFlashingColors() // Ensure any existing timer is stopped
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            DispatchQueue.main.async {
                self.currentIndex = (self.currentIndex + 1) % colorsCount
            }
        }
    }

    func stopFlashingColors() {
        timer?.invalidate()
        timer = nil
    }
}

