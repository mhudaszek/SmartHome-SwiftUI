//
//  DeviceCell.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct DeviceCell: View {
    var device: Device

    var body: some View {
        HStack(spacing: 15) {
            Image("lampIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 8) {
                Text("Dupa 1")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text("Living room")
                    .font(.footnote)
                    .padding(.horizontal, 11)
                    .padding(.vertical, 5)
                    .background(
                      Capsule().strokeBorder(Color.white, lineWidth: 1.25)
                    )
            }
            Spacer()
            Image(systemName: device.state
                    ? "lightbulb"
                    : "lightbulb.fill")
                .imageScale(.large)
                .padding(.trailing, 10)
        }
    }

}

struct DeviceCell_Previews: PreviewProvider {
    static var previews: some View {
        DeviceCell(device: .init(ResultMap()))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
