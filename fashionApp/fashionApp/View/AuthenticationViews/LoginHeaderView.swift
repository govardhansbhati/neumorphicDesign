//
//  LoginHeaderView.swift
//  fashionApp
//
//  Created by govardhan singh on 22/12/20.
//

import SwiftUI

struct LoginHeaderView: View {
    var headerText  = ""
    var gradient1 = [Color("gradient3"),Color("gradient2"),Color("gradient1") ]
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: .init(colors: gradient1), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .clipShape(RoundedCorner(radius: 200, corners: [.bottomRight]))
                                .shadow(color: Color(#colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.7529411765, alpha: 0.25)), radius: 2, x: -5, y: -5)
                                .shadow(color: Color(#colorLiteral(red: 1, green: 0, blue: 1, alpha: 0.25)), radius: 2, x: 5, y: 5)
                )
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 5, x: -10, y: -10)
                .shadow(color: Color(#colorLiteral(red: 0.3550756545, green: 0.8867811346, blue: 1, alpha: 0.4)), radius: 5, x: 10, y: 10)
            Text(headerText)
                .font(.title)
                .foregroundColor(.white)
                .padding(.leading, 24)
                .padding(.bottom, 44)
        }
        
        .frame(height: 150, alignment: .top)
    }
}

struct LoginHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeaderView()
    }
}
