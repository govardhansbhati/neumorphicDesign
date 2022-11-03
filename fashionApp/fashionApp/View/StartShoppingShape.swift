//
//  StartShoppingShape.swift
//  fashionApp
//
//  Created by govardhan singh on 19/12/20.
//

import SwiftUI

struct StartShoppingShape : Shape {
    
    func path(in rect : CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: 0, y: 70))
            path.addLine(to: CGPoint(x: 0, y: rect.height + 40))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height + 40))
            path.addLine(to: CGPoint(x: rect.width, y: 70))
            
            let MidX = rect.width / 2
            let Width = rect.width
            
            let ControlWidth = MidX - 100
            
            path.move(to: CGPoint(x: 0, y: 70))
            
            let to = CGPoint(x: MidX, y: -55)
            let control1 = CGPoint(x: ControlWidth, y: 70)
            let control2 = CGPoint(x: ControlWidth - 30, y: -55)
            
            let to1 = CGPoint(x: Width, y: 70)
            let control3 = CGPoint(x: Width - (ControlWidth - 30), y: -55)
            let control4 = CGPoint(x: Width - ControlWidth, y: 70)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
