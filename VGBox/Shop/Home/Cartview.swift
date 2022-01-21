//
//  Cartview.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/13.
//

import SwiftUI

struct Cartview: View {
    
    @EnvironmentObject var MyData:ShopMenu
    @State var isshow = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("購物車")
                    .font(.title)
                Rectangle()
                    .frame(maxWidth:.infinity)
                    .frame(height:1.5)
                ScrollView(showsIndicators:false) {
                    HStack {
                        Image("Broccoli")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .padding(.leading,20)
                        VStack {
                            Text("青花菜")
                                .font(.title)
                            Text("(50g/一份|40元)")
                        }
                        Spacer()
                        HStack {
                            Text("s")
                                .font(.title2)
                                .frame(width: 56, height: 40)
                                .cornerRadius(5)
                                .background(Color("healthybuttom3"))
                            Image(systemName: "minus.square.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.gray)
                                .cornerRadius(5)
                            Image(systemName: "plus.square.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.gray)
                                .cornerRadius(5)
                        }
                        Spacer()
                    }
                    foodmenu()
                }
                Spacer()
                BuyView()
                Spacer()
                    .frame(height: 20)
            }.blur(radius: isshow ? 9 : 0)
            CheckView().offset(x: isshow ? 0:1000)
        }
    }
    @ViewBuilder func foodmenu() -> some View{
        VStack{
            ForEach(MyData.showOrder){ od in
                HStack {
                    Image("\(od.menu.ItemView)")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .padding(.leading,20)
                    VStack {
                        Text("\(od.menu.name)")
                            .font(.title)
                        Text("(\(od.menu.infrom.foodweight)/一份|\(od.menu.prise)元)")
                    }
                    Spacer()
                    HStack {
                        Text("\(od.numbers)")
                            .font(.title2)
                            .frame(width: 56, height: 40)
                            .cornerRadius(5)
                            .background(Color("healthybuttom3"))
                        Image(systemName: "minus.square.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .cornerRadius(5)
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .cornerRadius(5)
                    }.padding(.leading,15)
                    Spacer()
                }
            }
        }
    }
    
    @ViewBuilder func BuyView() -> some View{
        HStack {
            VStack{
                Text("小計：")
                    .font(.title2)
                Text("運費：")
                    .font(.title2)
                Text("總共：")
                    .font(.title2)
            }.padding(.leading,10)
            Spacer()
            Text("購買")
                .font(.title)
                .frame(width: 85, height: 85)
                .background(Color(.gray))
                .cornerRadius(5)
                .padding(.trailing,10)
                .onTapGesture {
                    isshow.toggle()
                }
        }
}
    @ViewBuilder func CheckView() -> some View{
        VStack{
            Spacer()
            Text("確定結帳？")
                .font(.system(size: 35, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
            Spacer()
            Text("確定")
                .font(.system(size: 35, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .onTapGesture {
                    MyData.Orders.append(order(onOrder: MyData.showOrder))
                    MyData.showOrder.removeAll()
                    isshow.toggle()
                }
                .frame(width: 200, height: 50)
                .background(Color(.red))
                .cornerRadius(10)
            Spacer()
        }.frame(width: 340, height: 200)
            .background(Color(.gray))
            .cornerRadius(20)
    }
}

struct Cartview_Previews: PreviewProvider {
    static var previews: some View {
        Cartview().environmentObject(ShopMenu())
    }
}
