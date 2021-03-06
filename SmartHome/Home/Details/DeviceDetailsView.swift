//
//  DeviceDetailsView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct DeviceDetailsView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReader { reader in
                VStack(alignment: .center, spacing: 30) {
                    Image("tv_Image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
//                            .overlay(Color.black.opacity(0.3))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
//                        .offset(y: -reader.frame(in: .global).minY)
                        .frame(width: UIScreen.main.bounds.width, height: reader.getParalaxHeight(from: 150))
                        .padding(.top, 20)
                    Spacer()
                        .frame(height: 50)
                    Button(action: {}, label: {
                        Image(systemName: "power")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .foregroundColor(.accentColor)
                    })
                }

            }
            .frame(height: 180)

            VStack(alignment: .center, spacing: 20) {


//                Image("tv_Image")
//                    .resizable()
//                    .scaledToFit()
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
//                    .padding(.top, 20)
//                    .offset(y: -reader.frame(in: .global).minY)
//                    .frame(width: UIScreen.main.bounds.width, height: reader.getParalaxHeight(from: 220))

//                Text("Living room")
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
//                    .multilineTextAlignment(.center)
//                    .padding(.vertical, 8)
//                    .foregroundColor(.primary)
//                    .background(
//                        Color.accentColor
//                            .frame(height: 6)
//                            .offset(y: 24)
//                    )
//                    .padding(.bottom, 100)
//
//                Image(systemName: "power")
//                    .renderingMode(.template)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 150)
//                    .foregroundColor(.accentColor)
                
            }
            .navigationBarTitle("Living room", displayMode: .inline)
        }
    }
}

struct DeviceDetailsView_reviews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeviceDetailsView()
        }
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 11 Pro")
    }
}

/*
 Text("fkjsdbnfkjhadsbfhjksdabfkjhasdbfkjhabdshjkfbadskjfbadskjhbfhjkasdbfkjhasdb flhjas fjasdbljfbasdjhfbjhsdbfkjhasdbfjhkasbdfjhasldjbfs")
   .font(.headline)
   .multilineTextAlignment(.leading)
   .foregroundColor(.accentColor)
   .padding(.horizontal)

 Group {
     HeaderView(headerImage: "photo.on.rectangle.angled",
                headerTitle: "gfdgdfgdfgdsgdfg")
     GalleryView()
 }

 struct DeviceDetailsView: View {
     var body: some View {
         ScrollView(.vertical, showsIndicators: false) {
             VStack(alignment: .center, spacing: 20) {
                 GeometryReader { reader in
                     ZStack {
                         Image("tv_Image")
                             .resizable()
                             .aspectRatio(contentMode: .fill)
 //                            .overlay(Color.black.opacity(0.3))
                             .clipShape(Circle())
                             .overlay(Circle().stroke(Color.white, lineWidth: 8))
                             .offset(y: -reader.frame(in: .global).minY)
                             .frame(width: UIScreen.main.bounds.width, height: reader.getParalaxHeight(from: 150))

 //                        makeHeader()
                     }
                     .padding(.top, 120)
                 }
 //                .padding(.top, 120)
                 .frame(height: 180)

 //                Image("tv_Image")
 //                    .resizable()
 //                    .scaledToFit()
 //                    .clipShape(Circle())
 //                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
 //                    .padding(.top, 20)
 //                    .offset(y: -reader.frame(in: .global).minY)
 //                    .frame(width: UIScreen.main.bounds.width, height: reader.getParalaxHeight(from: 220))

                 Text("Living room")
                     .font(.largeTitle)
                     .fontWeight(.heavy)
                     .multilineTextAlignment(.center)
                     .padding(.vertical, 8)
                     .foregroundColor(.primary)
                     .background(
                         Color.accentColor
                             .frame(height: 6)
                             .offset(y: 24)
                     )
                     .padding(.bottom, 100)

                 Image(systemName: "power")
                     .renderingMode(.template)
                     .resizable()
                     .scaledToFit()
                     .frame(height: 150)
                     .foregroundColor(.accentColor)

             }
             .navigationBarTitle("Learn fiusbfiuas", displayMode: .inline)
         }
     }
 }

 */

