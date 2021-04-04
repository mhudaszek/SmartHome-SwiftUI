//
//  RoomItem.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 04/04/2021.
//

import SwiftUI

struct RoomItem: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var color: Color
}

var roomItems = [
    RoomItem(title: "fdsfsd",
             subtitle: "sd",
             image: "bedroom",
             color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
    RoomItem(title: "fdsfsd",
             subtitle: "sd",
             image: "tv_Image",
             color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
    RoomItem(title: "fdsfsd",
             subtitle: "sd",
             image: "tv_Image",
             color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
    RoomItem(title: "fdsfsd",
             subtitle: "sd",
             image: "tv_Image",
             color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
]
