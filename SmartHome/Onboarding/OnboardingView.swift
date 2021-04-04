//
//  OnboardingView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 06/03/2021.
//

import SwiftUI
import Lottie

struct OnboardingView: View {
    var finishedAnimation: (() -> Void)

    var body: some View {
        LottieView(name: "lamp-outline", loopMode: .playOnce)
            .onAppear { handleAnimation() }
    }

    private func handleAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.finishedAnimation()
        }
    }
}
