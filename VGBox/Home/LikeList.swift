//
//  LikeList.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/13.
//

import SwiftUI

struct LikeList: View {
    
    @EnvironmentObject var MyData:ShopMenu
    
    var body: some View {
        VStack {
            Text("我的最愛")
                .font(.title)
            Rectangle()
                .frame(maxWidth:.infinity)
                .frame(height:1.5)
            Spacer()
            ScrollView(showsIndicators:false){
                VStack{
                    ForEach(MyData.likeOrder){ od in
                        HStack {
                            Image("\(od.menu.ItemView)")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .padding(.leading,20)
                            VStack {
                                Text("\(od.menu.name)")
                                    .font(.title)
                            }
                            Image(systemName: "heart.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(od.menu.like ? Color(.gray) : Color("lightred") )
                                .padding(.trailing,20)
                                .onTapGesture {
                                   // MyData.mark(id: od.menu.id, Lk:od.menu.like ? false : true)
                                    MyData.addlike(value: od.menu, quanty: 0)
                                    
                                }

                        }
                    }
                }
            }
        }
    }
}

struct LikeList_Previews: PreviewProvider {
    static var previews: some View {
        LikeList().environmentObject(ShopMenu())
    }
}
