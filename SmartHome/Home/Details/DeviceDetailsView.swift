//
//  DeviceDetailsView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct DeviceDetailsView: View {
    let viewModel: DeviceDetailsViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReader { reader in
                VStack(alignment: .center, spacing: 30) {
                    Image("tv_Image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .shadow(radius: 7)
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                        .frame(width: UIScreen.main.bounds.width, height: reader.getParalaxHeight(from: 150))
                        .padding(.top, 20)

                    Spacer()
                        .frame(height: 50)

                    DeviceStateButton(isSet: viewModel.$device2.state)
                }

            }
            .frame(height: 180)
            .navigationBarTitle("Living room", displayMode: .inline)
        }
    }
}

struct DeviceDetailsView_reviews: PreviewProvider {
    private enum DevicePreview: String {
        case SE = "iPhone SE (2nd generation)"
        case XSMax = "iPhone XS Max"
    }

    static var previews: some View {
        ForEach([DevicePreview.SE.rawValue, DevicePreview.XSMax.rawValue], id: \.self) { deviceName in

            NavigationView {
                DeviceDetailsView(viewModel: .init(device: Device(ResultMap()), deviceState: .constant(false), device2: .constant(Device(ResultMap()))))
            }
            .preferredColorScheme(.dark)
            .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
