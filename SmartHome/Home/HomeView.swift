//
//  ContentView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct HomeView: View {
    enum HeaderSections: String {
        case favoriteScenes = "Favorite scenes"
        case rooms = "Rooms"
        case allDevices = "All devices"
    }
    @StateObject var viewModel: HomeViewModel
    @Binding var showProfile: Bool
    @Namespace var nameSpace

    var body: some View {
        NavigationView {
            List() {
                HeaderSection(showProfile: $showProfile)
                CategoryGridView(headerTitle: HeaderSections.favoriteScenes.rawValue)
                RoomsSection(devices: viewModel.devices)
                DevicesSection(viewModel: viewModel)
            }
            .navigationBarHidden(true)
        }
    }
}

struct HeaderSection: View {
    @Binding var showProfile: Bool
    var body: some View {
        HStack {
            Text("My Smart Home")
                .font(.system(size: 28, weight: .bold))
            Spacer()
            Button(action: { self.showProfile.toggle() }) {
                Image("lampIcon")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            }
        }
    }
}


struct RoomsSection: View {
    var devices: [Device]
    var body: some View {
        Group {
            NavigationLink(
                destination: RoomsView(devices: devices),
                label: {
                    HeaderView(headerImage: "photo.on.rectangle.angled",
                               headerTitle: HomeView.HeaderSections.rooms.rawValue)
                })
            GalleryView()
                .padding(.bottom, 20)
        }
    }
}

struct DevicesSection: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        HeaderView(headerImage: "photo.on.rectangle.angled",
                   headerTitle: HomeView.HeaderSections.allDevices.rawValue)
        ForEach(0 ..< viewModel.devices.count) { index in
            let deviceDetailsViewModel = DeviceDetailsViewModel( deviceState: $viewModel.devices[index].state, device: $viewModel.devices[index])

            NavigationLink(destination: DeviceDetailsView(viewModel: deviceDetailsViewModel)) {
                DeviceCell(device: viewModel.devices[index])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(devices: []), showProfile: .constant(true))
            .preferredColorScheme(.dark)
    }
}
