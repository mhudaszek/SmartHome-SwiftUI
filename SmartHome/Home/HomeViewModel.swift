//
//  HomeViewModel.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 06/03/2021.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var devices: [Device]

    init(devices: [Device]) {
        self.devices = devices
    }
}
