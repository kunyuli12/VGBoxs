//
//  PurchaseHistory.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/13.
//

import SwiftUI

struct PurchaseHistory: View {
    
    @EnvironmentObject var MyData:ShopMenu
    @State var myoder = [
        Oder(menu: menu(ItemView: "Broccoli", prise: 70, name: "花椰菜",infrom:foodinfrom(foodweight: "2台斤", foodplace: "台南", foodtime: "冷藏５～７天"),swNumber:0,like: false), numbers: 1)
    ]
    @State var showOrder = false
    
    var body: some View {
        VStack {
            Text("Order History")
                .font(.largeTitle)
            Spacer()
            ScrollView(showsIndicators:false) {
                ForEach(MyData.Orders){ od in
                    VStack{
                        Text("History Order")
                            .font(.title)
                            .foregroundColor(Color(.gray))
                       
                        ForEach(myoder){ my in
                            Text("\(my.menu.prise)元")
                                .font(.title2)
                                .foregroundColor(Color(.gray))
                        }
                        
                    }.frame(width: 370, height: 100)
                        .background(Color(.yellow))
                        .cornerRadius(20)
                        .onTapGesture {
                            showOrder.toggle()
                            myoder = od.onOrder
                        }
                }
            }
        }.blur(radius: showOrder ? 9 : 0)
        .sheet(isPresented: $showOrder){
            showList()
        }
    }
    @ViewBuilder func showList() -> some View{
        ZStack{
            Rectangle()
                .foregroundColor(Color("WhiteOne"))
            VStack{
                Text("歷史紀錄")
                    .font(.title)
                ScrollView {
                    ForEach(myoder){ myod in
                        HStack {
                            Image("\(myod.menu.ItemView)")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .padding(.leading,20)
                            VStack{
                                Text("\(myod.menu.name)")
                                .font(.title)
                            Text("(\(myod.menu.infrom.foodweight)/一份|\(myod.menu.prise)元)")
                            }
                            Text("\(myod.numbers)")
                                .font(.title2)
                                .frame(width: 56, height: 40)
                                .background(Color("healthybuttom3"))
                                .cornerRadius(20)
                        }.frame(width: 370, height: 120)
                        .background(Color("WhiteTwo"))
                        .cornerRadius(15)
                    }
                }
            }
        }
    }
}

struct PurchaseHistory_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseHistory().environmentObject(ShopMenu())
    }
}

