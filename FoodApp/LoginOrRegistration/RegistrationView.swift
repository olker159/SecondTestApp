//
//  RegistrationView.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 08/09/2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack{
                
                VStack(spacing: 25){
                    Spacer()
                    CustomInputField(imageName: "mail", placeholderText: "Email", isSecureField: false, text: $email)
                        .disableAutocorrection(true)
                    
                    CustomInputField(imageName: "person", placeholderText: "Username", isSecureField: false, text: $email)
                        .disableAutocorrection(true)
                    
                    
                    CustomPasswordField()
                        .disableAutocorrection(true)
                    
                }
                .padding(.horizontal,50)
                //.background(Color(.systemGreen).opacity(0.2).frame(width: 320, height: 130).cornerRadius(20))
                
                Button {
                    print("You just signed in")
                } label: {
                    Text("Sign up")
                }
                .buttonStyle(styleOfButton())
                .padding(.horizontal,50)
                .padding(.top, 30)
                
                
                VStack(alignment: .center, spacing: 20) {
                    
                    Spacer()

                    
                    Text("Already have an account?")
                        .foregroundColor(.green)
                        .font(.body)
                        .fontWeight(.bold)
                    
                    
                    NavigationLink(destination: {
                        LogInView()
                            .navigationBarHidden(true)
                    }, label: {
                        Text("Sign In")
                    })
                    .buttonStyle(styleOfButton())
                    .padding(.horizontal,100)
                    
                    
                    Spacer()
                }
                
            }
            .navigationBarHidden(true)
        }.onAppear {
            viewModel.fecth()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
