//
//  DeviceStateButton.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 07/03/2021.
//

import SwiftUI

struct DeviceStateButton: View {
    
    @Binding var isSet: Bool

    var body: some View {
        Button(action: { isSet.toggle() }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
        .padding()
    }
}

struct DeviceStateButton_Previews: PreviewProvider {
    static var previews: some View {
        DeviceStateButton(isSet: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
