//
//  MessageView.swift
//  LexxiStore
//
//  Created by Yerasyl on 02.05.2024.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Сообщения")
//                    .foregroundStyle(Color.white)
                    .font(.title)
                Spacer()
                Spacer()
            }.padding()
            
            Spacer()
            
            Text("Сообщений пока нет")
//                .foregroundStyle(Color.white)
                .font(.subheadline)
            Spacer()
        }
    }
}

#Preview {
    MessageView()
}
