//
//  TabView.swift
//  VictoriaCourt
//
//  Created by govardhan singh on 15/12/20.
//

import SwiftUI

enum SmartView {
  case Home
  case Catelouge
  case Favourite
  case Profile
}

struct TabView: View {
  @State var selectedItem = SmartView.Home
  
  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        ZStack {
            HomeView()
          if self.selectedItem == .Home {
//            HomeView()
            CatelougeView().hidden()
            FavouriteView().hidden()
            ProfileView().hidden()
          } else if self.selectedItem == .Catelouge {
            HomeView().hidden()
            CatelougeView()
            FavouriteView().hidden()
            ProfileView().hidden()

          } else if self.selectedItem == .Favourite {
            HomeView().hidden()
            CatelougeView().hidden()
            FavouriteView()
            ProfileView().hidden()

          }else if self.selectedItem == .Profile {
            HomeView().hidden()
            CatelougeView().hidden()
            FavouriteView().hidden()
            ProfileView()

          }
        }
        .padding(.bottom, 20)
        
        
        TabBarView(
          selectedItem: self.$selectedItem,
          tabBarItems: [
            TabBarItemView(
                selectedItem: self.$selectedItem,
              smartView: .Home,
              icon: "m_home_icn"),
            TabBarItemView(
                selectedItem: self.$selectedItem,
              smartView: .Catelouge,
              icon: "catelouge_icn"),
            TabBarItemView(
                selectedItem: self.$selectedItem,
              smartView: .Favourite,
              icon: "Favourite_icn"),
            TabBarItemView(
                selectedItem: self.$selectedItem,
              smartView: .Profile,
              icon: "profile_icn")
            
        ])
            
          .padding(.bottom, geometry.safeAreaInsets.bottom / 2)
          .background(Color.lairBackgroundGray)
        
            .cornerRadius(20)
      }
      .edgesIgnoringSafeArea(.bottom)
    }
  }
}

struct TabView_Previews: PreviewProvider {
  static var previews: some View {
    TabView()
  }
}
