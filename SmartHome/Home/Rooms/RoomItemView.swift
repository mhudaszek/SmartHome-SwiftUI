//
//  RoomView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 03/04/2021.
//

import SwiftUI

struct RoomItemView: View {
    var room: RoomItem = roomItems[0]
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {

            Image(room.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .background(room.color)
        .clipShape(RoundedRectangle(cornerRadius: 13,
                                    style: .continuous))
        .shadow(color: room.color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomItemView()
    }
}

/*
 var body: some View {
     VStack(alignment: .leading, spacing: 4.0) {
         Spacer()
         HStack {
             Spacer()
             Image(room.image)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
             Spacer()
         }
         Text(room.title).fontWeight(.bold).foregroundColor(Color.white)
         Text(room.subtitle).font(.footnote).foregroundColor(Color.white)
     }
     .padding(.all)
     .background(room.color)
     .clipShape(RoundedRectangle(cornerRadius: 22,
                                 style: .continuous))
     .shadow(color: room.color.opacity(0.3), radius: 20, x: 0, y: 10)
 }
 */
