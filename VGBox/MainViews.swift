//
//  MainViews.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/3.
//

import SwiftUI

struct MainViews: View {
    
    enum selectionName {
        case  shopping_cart
        case  home_view
        case  health
    }
    
    @StateObject var MyData = ShopMenu()
    @StateObject var cacu = Cacus()
    @StateObject var AgeViews = VGinform()
    @State var selectionId = selectionName.shopping_cart
    @State var numbers = "home"
    
    
    var body: some View {
        
        VStack {
            TabView(selection:$selectionId){
                    ShopView().environmentObject(MyData)
                    .tabItem { Image(systemName:"cart.fill.badge.plus")
                    }
                    .tag(selectionName.shopping_cart)
                HomeView().environmentObject(MyData)
                    .tabItem { Image(systemName:"house.fill")
                    }
                    .tag(selectionName.home_view)
                HealtView().environmentObject(MyData).tabItem { Image(systemName:"heart.text.square.fill")
                }.environmentObject(AgeViews)
                .tag(selectionName.health)
            }
        }
        .onAppear {
            selectionId = .home_view
        }
    }
}

struct MainViews_Previews: PreviewProvider {
    static var previews: some View {
        MainViews()
    }
}
