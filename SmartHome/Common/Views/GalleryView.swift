//
//  GalleryView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(0 ..< 5) { item in
                    Image("tv_Image")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(12)
                }
            }
        }

    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
