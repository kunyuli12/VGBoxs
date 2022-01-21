//
//  buybuttom.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/27.
//

import SwiftUI

struct buybuttom: View {
    
    @State var onoff = false
    @State var shownumber = ""
    @State var numbernew = 0
    
    
    var body: some View {
        
            Text("\(numbernew)")
        
    }
}

struct buybuttom_Previews: PreviewProvider {
    static var previews: some View {
        buybuttom()
    }
}
/*
 ZStack {
     HStack {
         Spacer()
         Text("購買數量")
             .font(.title2)
         TextField("數量",text: $shownumber)
             .frame(maxWidth:.infinity )
             .frame( height: 40, alignment: .center)
             .padding(.horizontal,10)
             .background(Color("Colorone"))
             .cornerRadius(20)
             .padding(.leading,2)
             .padding(.trailing,2)
         
         Image(systemName: "minus.square.fill")
             .resizable()
             .frame(width: 40, height: 40)
             .foregroundColor(.gray)
             .cornerRadius(5)
             .onTapGesture {
                 numbernew = numbernew-1
             }
         
         Image(systemName: "plus.square.fill")
             .resizable()
             .frame(width: 40, height: 40)
             .foregroundColor(.gray)
             .cornerRadius(5)
             .onTapGesture {
                 numbernew = numbernew+1
             }
         Spacer()
     }
 }
 */
