//
//  DeviceDetailsViewModel.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 07/03/2021.
//

import Foundation
import SwiftUI

class DeviceDetailsViewModel {
    private let device: Device
    @Binding var deviceState: Bool
    @Binding var device2: Device

    init(device: Device, deviceState: Binding<Bool>, device2: Binding<Device>) {
        self.device = device
        _deviceState = deviceState

        //
        _device2 = device2
    }
}
