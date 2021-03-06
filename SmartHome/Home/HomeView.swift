//
//  ContentView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct HomeView: View {
    let viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            List() {
                CategoryGridView()

                Group {
                    HeaderView(headerImage: "photo.on.rectangle.angled",
                               headerTitle: "Rooms")
                    GalleryView()
                        .padding(.bottom, 20)
                }

                HeaderView(headerImage: "photo.on.rectangle.angled",
                           headerTitle: "All devices")

                ForEach(0 ..< viewModel.devices.count) { index in
                    NavigationLink(destination: DeviceDetailsView()) {
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
    }
}
