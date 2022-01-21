//
//  HomeView.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/3.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
            NavigationView{
                    VStack {
                        VStack{
                            Circle()
                                .frame(width: 170, height: 170, alignment: .center)
                                .foregroundColor(Color(.lightGray))
                            Text("用戶名稱")
                        }
                        HStack{
                            Spacer()
                            NavigationLink{
                                PurchaseHistory()
                            } label:{
                            enterbuttom(entertext:"購買記錄")
                            }
                            Spacer()
                            NavigationLink{
                                LikeList()
                            } label:{
                            enterbuttom(entertext:"我的最愛")
                            }
                            Spacer()
                        }
                        Spacer()
                            .frame(height: 20)
                        HStack{
                            Spacer()
                            NavigationLink{
                                Cartview()
                            } label:{
                            enterbuttom(entertext:"購物車")
                            }
                            Spacer()
                            NavigationLink{
                                Account()
                            } label:{
                            enterbuttom(entertext:"帳戶")
                            }
                            Spacer()
                        }
                        Spacer()
                    }.navigationBarTitle(Text(" "),displayMode: .inline)
                }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct enterbuttom: View {
    @State var entertext = " "
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 180, height: 180, alignment: .center)
                .cornerRadius(20)
                .foregroundColor(Color("HomecolorBU"))
            Text("\(entertext)")
                .foregroundColor(.black)
        }
    }
}
