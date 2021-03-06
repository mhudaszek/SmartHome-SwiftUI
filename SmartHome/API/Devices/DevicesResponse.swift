//
//  DevicesResponse.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 06/03/2021.
//

import Foundation

public typealias ResultMap = [String: Any?]

struct Device {
    let id: Int
    let title: String?

    enum CodingKeys: String, CodingKey {
        case id, title
    }

    init(_ resultMap: ResultMap) {
        self.id = resultMap[CodingKeys.id.rawValue] as? Int ?? 0
        self.title = resultMap[CodingKeys.title.rawValue] as? String
    }
}

struct DevicesResponse {
    var devices: [Device]?

    init(_ resultMap: [ResultMap]) {
        self.devices = resultMap.map { Device($0) }
    }
}

extension DevicesResponse: Equatable {
    static func == (lhs: DevicesResponse, rhs: DevicesResponse) -> Bool {
        lhs.devices?.count == rhs.devices?.count
    }
}

extension DevicesResponse {
    static let empty = DevicesResponse([])
}
