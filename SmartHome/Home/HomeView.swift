//
//  ContentView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct HomeView: View {
    private enum HeaderSections: String {
        case favoriteScenes = "Favorite scenes"
        case rooms = "Rooms"
        case allDevices = "All devices"
    }
    @StateObject var viewModel: HomeViewModel

    @State var show = false
    @Namespace var nameSpace

    var body: some View {
        if show {
            ScrollView {
                Image("tv_Image")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(12)
                    .matchedGeometryEffect(id: "Card", in: nameSpace)
            }
            .transition(.opacity)
            .edgesIgnoringSafeArea(.all)
        }

        NavigationView {
            List() {
                CategoryGridView(headerTitle: HeaderSections.favoriteScenes.rawValue)

                Group {
                    NavigationLink(
                        destination: RoomsView(),
                        label: {
                            HeaderView(headerImage: "photo.on.rectangle.angled",
                                       headerTitle: HeaderSections.rooms.rawValue)
                        })
                    GalleryView()
                        .padding(.bottom, 20)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                show.toggle()
                            }
                        }
                }

                HeaderView(headerImage: "photo.on.rectangle.angled",
                           headerTitle: HeaderSections.allDevices.rawValue)


                ForEach(0 ..< viewModel.devices.count) { index in
                    let deviceDetailsViewModel = DeviceDetailsViewModel(device: viewModel.devices[index], deviceState: $viewModel.devices[index].state, device2: $viewModel.devices[index])

                    NavigationLink(destination: DeviceDetailsView(viewModel: deviceDetailsViewModel)) {
                        DeviceCell(device: viewModel.devices[index])
                    }
                }
            }
            .navigationTitle("My Home")
            .toolbar {
              ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                  Button(action: {
                    print("List view is activated")
                  }) {
                    Image(systemName: "square.fill.text.grid.1x2")
                      .font(.title2)
                      .foregroundColor(.accentColor)
                  }
                }
              }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(devices: []))
            .preferredColorScheme(.dark)
            .environmentObject(DeviceData())
    }
}
