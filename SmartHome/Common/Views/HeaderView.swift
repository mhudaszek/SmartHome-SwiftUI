//
//  HeaderView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct HeaderView: View {

    var headerImage: String
    var headerTitle: String

    var body: some View {
        HStack {
            Image(systemName: headerImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)

            Text(headerTitle)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(headerImage: "photo.on.rectangle.angled",
                   headerTitle: "gfdgdfgdfgdsgdfg")
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
    }
}
