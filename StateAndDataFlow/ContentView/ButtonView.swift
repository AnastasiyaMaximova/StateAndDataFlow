//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Anastasya Maximova on 28.01.2025.
//

import SwiftUI

struct ButtonView: View {
    var contentViewVM: ContentViewViewModel
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(title == "Log out" ? .blue : .red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay (
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ButtonView(contentViewVM: ContentViewViewModel(), title: "Button", action: {})
        }
    }
}
