//
//  SmartHomeApp.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI
import Firebase
import UIKit

@main
struct SmartHomeApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var devicesResponse: DevicesResponse
    @State private var finishedOnboardingAnimation: Bool = false

    private let firebaseManager = FirebaseManager()

    init() {
        _devicesResponse = State(initialValue: .empty)
    }

    var body: some Scene {
        WindowGroup {
            if finishedOnboardingAnimation && devicesResponse != .empty {
                makeHome()
            } else {
                makeOnboarding()
            }
        }
    }
}

private extension SmartHomeApp {
    func makeHome() -> HomeView {
        let homeViewModel = HomeViewModel(devices: devicesResponse.devices ?? [])
        return HomeView(viewModel: homeViewModel)
    }

    func makeOnboarding() -> OnboardingView {
        fetchData()
        let onboardingView = OnboardingView(finishedAnimation: {
            finishedOnboardingAnimation = true
        })
        return onboardingView
    }

    func fetchData() {
        firebaseManager.fetchDevices { response in
            self.devicesResponse = response
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
