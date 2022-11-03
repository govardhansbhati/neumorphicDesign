//
//  Tabbar.swift
//  VictoriaCourt
//
//  Created by govardhan singh on 15/12/20.
//

import SwiftUI

struct TabBarView: View {
  @Binding var selectedItem: SmartView
  
  var tabBarItems: [TabBarItemView]
  
  var body: some View {
    HStack {
        
      ForEach(tabBarItems, id: \.uuid) { item in
        HStack {
          Spacer()
          
          item
          
          Spacer()
        }
      }
    }
    .padding(.top, 11)
    .padding(.bottom, 22)
  }
}

struct TabBarView_Previews: PreviewProvider {
  static var previews: some View {
    TabBarView(
      selectedItem: .constant(.Home),
      tabBarItems: [
        TabBarItemView(
            selectedItem: .constant(.Home),
          smartView: .Home,
          icon: "m_home_icn"),
        TabBarItemView(
            selectedItem: .constant(.Home),
          smartView: .Catelouge,
          icon: "catelouge_icn"),
        TabBarItemView(
            selectedItem: .constant(.Home),
          smartView: .Favourite,
          icon: "Favourite_icn"),
        TabBarItemView(
            selectedItem: .constant(.Home),
          smartView: .Profile,
          icon: "profile_icn")
      ]
    )
  }
}

