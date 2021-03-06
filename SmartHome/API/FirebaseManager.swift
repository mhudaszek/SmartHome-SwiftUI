//
//  FirebaseManager.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 06/03/2021.
//

import Firebase

class FirebaseManager {
    private enum ConditionRef: String {
        case devices
    }

    func fetchDevices(completion: @escaping (DevicesResponse) -> Void) {
        let rootRef = Database.database().reference()
        let conditionRef = rootRef.child(ConditionRef.devices.rawValue)
        conditionRef.observe(.value) { snap in
            guard let result = snap.value as? [ResultMap] else { return }
            completion(DevicesResponse(result))
        }
    }
}
