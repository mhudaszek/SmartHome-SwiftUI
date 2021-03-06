//
//  GeometryProxy+Extensions.swift
//  SmartHome
//
//  Created by Mirosław Hudaszek on 05/03/2021.
//

import SwiftUI

extension GeometryProxy {
    func getParalaxHeight(from heigth: CGFloat) -> CGFloat {
        self.frame(in: .global).minY > -heigth ? self.frame(in: .global).minY + heigth : heigth
    }
}
