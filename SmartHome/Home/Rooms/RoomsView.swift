//
//  RoomsView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 03/04/2021.
//

import SwiftUI

struct RoomsView: View {
    @State var show = false
    @Namespace var namespace
    @State var selectedItem: RoomItem? = nil
    @State var isDisabled = false
    @State var isNavigationBarVisible = true
    @State var isGridLayout = false

    var devices: [Device]

    var body: some View {
        ZStack {
            NavigationView {
                content
                    .navigationBarHidden(true)
            }
            .navigationBarTitle("Rooms", displayMode: .inline)
            .navigationBarHidden(!isNavigationBarVisible)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isGridLayout.toggle()
                    }) {
                        Image(systemName: isGridLayout
                                ? "rectangle.grid.1x2"
                                : "square.grid.2x2")
                            .font(.title2)
//                        .foregroundColor(isGridViewActive ? .accentColor : .primary)
                    }
                }
            }
            fullContent
                .edgesIgnoringSafeArea(.all)
        }
    }

    var content: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: isGridLayout ? 160 : 200), spacing: 16)],
                spacing: 16
            ) {
                ForEach(roomItems) { item in
                    VStack {
                        RoomItemView(room: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                                    show.toggle()
                                    selectedItem = item
                                    isDisabled = true
                                    isNavigationBarVisible = false
                                }
                            }
                            .disabled(isDisabled)
                    }
                    .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        .zIndex(1)
    }

    @ViewBuilder
    var fullContent: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                RoomDetails(room: selectedItem!,
                            namespace: namespace, device: devices[0])

                CloseButton()
                    .padding(.top, 50)
                    .padding(.trailing, 20)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show.toggle()
                            selectedItem = nil
                            isNavigationBarVisible = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isDisabled = false
                            }
                        }
                    }
            }
            .zIndex(2)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
        }
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomsView(devices: [])
        }
    }
}
