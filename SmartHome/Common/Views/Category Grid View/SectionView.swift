//
//  SectionView.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

struct SectionView: View {
    @State var rotateClockwise: Bool
    var headerTitle: String

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text(headerTitle.uppercased())
                .font(.footnote)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))

            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.accentColor, lineWidth: 1)
        )
        .frame(width: 85)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(rotateClockwise: true, headerTitle: "")
            .previewLayout(.fixed(width: 120, height: 240))
            .padding()
            .background(Color.accentColor)
    }
}
