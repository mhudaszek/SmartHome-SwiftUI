//
//  DeviceCell.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct DeviceCell: View {

    let device: Device

    var body: some View {
        HStack {
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
                Text("kjfnsdkjfnskdfnlaksjcmnsadcksdm cmnasc dmnsnfkjlsadnfklasnfkjsandfkjnasdkfjnsdkjfnsdkjfnskljdfnsdk")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)

            }
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
