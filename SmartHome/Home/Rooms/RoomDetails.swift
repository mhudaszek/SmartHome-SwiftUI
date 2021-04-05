//
//  RoomDetails.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 04/04/2021.
//

import SwiftUI

struct RoomDetails: View {
    var room: RoomItem = roomItems[0]
    var namespace: Namespace.ID
    var device: Device

    var body: some View {
        VStack {
            ScrollView {
                RoomItemView(room: room)
                    .matchedGeometryEffect(id: room.id, in: namespace)
                    .frame(height: 300)
                VStack {
                    ForEach(roomItems) { item in
                        DeviceCell(device: Device(id: 0,
                                                  title: "fdsf",
                                                  state: true))
                        Divider()
                    }
                }
                .padding()
            }
            .navigationBarTitle("Living room", displayMode: .inline)
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .matchedGeometryEffect(id: "container\(room.id)", in: namespace)
    }
}

struct RoomDetails_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        NavigationView {
            RoomDetails(namespace: namespace, device: Device(id: 0,
                                                             title: "",
                                                             state: true))
        }
    }
}
