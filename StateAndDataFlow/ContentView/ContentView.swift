//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    private var contentViewVM =  ContentViewViewModel()
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.inputName)!")
                .font(.title)
                .padding(.top, 100)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
                
            Spacer()
            
            ButtonView(
                contentViewVM: contentViewVM,
                title: contentViewVM.buttonTitle,
                action: contentViewVM.startTimer
            )
            
            Spacer()
            
            ButtonView(
                contentViewVM: contentViewVM,
                title: contentViewVM.logOutButtonTitle,
                action: loginViewVM.logout
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(LoginViewViewModel())
}
