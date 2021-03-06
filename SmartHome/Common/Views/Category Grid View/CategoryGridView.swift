//
//  CategoryGridView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct CategoryGridView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                Section(
                    header: SectionView(rotateClockwise: false)
                ) {
                    ForEach(0 ..< 4) { item in
                        CategoryItemView()
                    }
                }
            })
            .frame(height: 140)
            .padding(.vertical, 10)
        })
    }
}

struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGridView()
            .previewLayout(.sizeThatFits)
    }
}
