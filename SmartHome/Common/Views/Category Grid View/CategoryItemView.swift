//
//  CategoryItemView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct CategoryItemView: View {

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Button(action: {}, label: {
            HStack(alignment: .center, spacing: 6) {
                Image(systemName: "photo.on.rectangle.angled")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.accentColor)

                Text("fsdfsadfds23")
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                Spacer()
            }
            .padding(10)
            .frame(width: 220)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
        })
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.accentColor)
    }
}
