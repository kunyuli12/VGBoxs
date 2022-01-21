//
//  HealtView.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/3.
//

import SwiftUI

struct HealtView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink{
                    MeatAnalyze()
                } label: {
                    HealthEnter(Titletext:"葷食")
                }
                Spacer()
                    .frame(height:40)
                NavigationLink{
                    Text("Hi")
                } label: {
                    HealthEnter(Titletext:"素食")
                }
                
            } .navigationBarTitle(Text("個人營養分析"))
        }
    }
}

struct HealtView_Previews: PreviewProvider {
    static var previews: some View {
        HealtView()
    }
}

struct HealthEnter: View {
    
    @State var Titletext = " "
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 240, height: 100)
                .cornerRadius(15)
            Text("\(Titletext)")
                .font(.title)
                .foregroundColor(.black)
        }
    }
}
