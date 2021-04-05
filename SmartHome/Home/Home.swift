//
//  Home.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/04/2021.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    @State var showContent = false

    @StateObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            HomeView(viewModel: viewModel,
                     showProfile: $showProfile)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all)

            if showProfile {
                MenuView()
                    .background(Color.black.opacity(0.001))
                    .offset(y: showProfile ? 0 : screen.height)
                    .offset(y: viewState.height)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    .onTapGesture {
                        self.showProfile.toggle()
                }
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                    }
                    .onEnded { value in
                        if self.viewState.height > 50 {
                            self.showProfile = false
                        }
                        self.viewState = .zero
                    }
                )
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(viewModel: HomeViewModel(devices: []))
            .preferredColorScheme(.dark)
    }
}
