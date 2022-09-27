//
//  LogInView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 07/09/2022.
//

import SwiftUI

struct LogInView: View {
    
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationView {
            VStack{
                Image("football-player-1")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.5)
                
                
                VStack(spacing: 25){
                    CustomInputField(imageName: "mail", placeholderText: "Email", isSecureField: false, text: $email)
                        .disableAutocorrection(true)
                    
                    
                    CustomPasswordField()
                        .disableAutocorrection(true)
                    
                }
                .padding(.horizontal,50)
                //.background(Color(.systemGreen).opacity(0.2).frame(width: 320, height: 130).cornerRadius(20))
                
                Button {
                    print("You just signed in")
                } label: {
                    Text("Sign in")
                }
                .buttonStyle(styleOfButton())
                .padding(.horizontal,50)
                .padding(.top, 30)
                
//                Divider()
//                    .padding(.top)
//                    .padding(.horizontal,20)
                                
                VStack(alignment: .center, spacing: 20) {
                    
                    Spacer()

                    
                    Text("If you don't have an account sign up now!")
                        .foregroundColor(.green)
                        .font(.body)
                        .fontWeight(.bold)
                    
                    
                    NavigationLink(destination: {
                        RegistrationView()
                            .navigationBarHidden(true)
                    }, label: {
                        Text("Sign Up")
                    })
                    .buttonStyle(styleOfButton())
                    .padding(.horizontal,100)
                    
                    
                    Spacer()
                }

                
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
