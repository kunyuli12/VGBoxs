//
//  ShopView.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/3.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink{
                    MeatList()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 120, alignment: .center)
                            .cornerRadius(15)
                        Text("蔬菜清單")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                
                Spacer()
                    .frame(height: 40)
                
                NavigationLink{
                    VegetableView()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 120, alignment: .center)
                            .cornerRadius(15)
                        Text("水果清單")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                
                
                Spacer()
                    .frame(height: 30)
                
            }
            .navigationBarTitle(Text("選擇食材清單"),displayMode: .inline)
            
        }
        
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
