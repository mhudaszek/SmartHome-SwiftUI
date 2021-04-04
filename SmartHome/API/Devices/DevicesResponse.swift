//
//  DevicesResponse.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 06/03/2021.
//

import SwiftUI

public typealias ResultMap = [String: Any?]

class DeviceData: ObservableObject {
    private let firebaseManager = FirebaseManager()
    @Published var devicesResponse = DevicesResponse([])
    @Published var devices = [Device]()

    init() {
        firebaseManager.fetchDevices { deviceResponse in
            self.devicesResponse = deviceResponse
            self.devices = deviceResponse.devices
        }
    }
}

struct Device: Identifiable {
    var id: Int
    var title: String?
    var state: Bool

    enum CodingKeys: String, CodingKey {
        case id, title
    }

    init(_ resultMap: ResultMap) {
        self.id = resultMap[CodingKeys.id.rawValue] as? Int ?? 0
        self.title = resultMap[CodingKeys.title.rawValue] as? String
        self.state = (resultMap[CodingKeys.title.rawValue] as? Bool) ?? false
    }

    init(id: Int, title: String?, state: Bool) {
        self.id = id
        self.title = title
        self.state = state
    }
}

struct DevicesResponse {
    var devices: [Device]

    init(_ resultMap: [ResultMap]) {
        self.devices = resultMap.map { Device($0) }
    }
}


extension DevicesResponse: Equatable {
    static func == (lhs: DevicesResponse, rhs: DevicesResponse) -> Bool {
        lhs.devices.count == rhs.devices.count
    }
}

extension DevicesResponse {
    static let empty = DevicesResponse([])
}
