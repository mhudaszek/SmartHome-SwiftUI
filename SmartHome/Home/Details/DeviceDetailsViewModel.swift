//
//  DeviceDetailsViewModel.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 07/03/2021.
//

import Foundation
import SwiftUI

class DeviceDetailsViewModel {
    @Binding var deviceState: Bool
    @Binding var device: Device

    init(deviceState: Binding<Bool>, device: Binding<Device>) {
        _deviceState = deviceState
        _device = device
    }
}
