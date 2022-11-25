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
    }//設定每個分支畫面的函數
    
    @StateObject var MyData = ShopMenu()//Shop的Model
    @StateObject var AgeViews = VGinform()//防疫箱的Model
    @State var selectionId = selectionName.shopping_cart
    @State var numbers = "home"//進去的第一個畫面
    var body: some View {
        VStack {
            TabView(selection:$selectionId){//標記每個view
                    ShopView().environmentObject(MyData)
                    .tabItem { Image(systemName:"cart.fill.badge.plus")
                    }
                    .tag(selectionName.shopping_cart)
                HomeView().environmentObject(MyData)//連接此Model
                    .tabItem { Image(systemName:"house.fill")
                    }
                    .tag(selectionName.home_view)
                VgBoxView().environmentObject(MyData).tabItem { Image(systemName:"heart.text.square.fill")
                }.environmentObject(AgeViews)
                .tag(selectionName.health)
            }
        }
        .onAppear {
            selectionId = .home_view//優先顯示honeView得畫面
        }
    }
}

struct MainViews_Previews: PreviewProvider {
    static var previews: some View {
        MainViews()
    }
}
