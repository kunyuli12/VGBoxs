//
//  LikeList.swift
//  IOShomework
//
//  Created by 暨大附中03 on 2021/12/13.
//

import SwiftUI

struct LikeList: View {
    var body: some View {
        VStack {
            Text("我的最愛")
                .font(.title)
            Rectangle()
                .frame(maxWidth:.infinity)
                .frame(height:1.5)
            Spacer()
        }
    }
}

struct LikeList_Previews: PreviewProvider {
    static var previews: some View {
        LikeList()
    }
}
