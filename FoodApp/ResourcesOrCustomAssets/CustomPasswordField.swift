//
//  CustomPasswordField.swift
//  FootballTest
//
//  Created by Oliver Pavlovsky on 07/09/2022.
//

// user.isCurrentUser ? "Edit Profile" : "Follow"

import SwiftUI

struct CustomPasswordField: View {
    
    var body: some View {
        DemoShowPassword()
    }
    
    struct DemoShowPassword: View {
            @State private var showPassword: Bool = false
            @State private var password = ""
            @FocusState var inFocus: Field?

            enum Field {
                case secure, plain
            }

            var body: some View {
                VStack {
                    HStack {
                        Image(systemName: "lock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(.darkGray))
                        
                        if showPassword {
                            TextField("Password", text: $password)
                                .focused($inFocus, equals: .plain)
                        } else {
                            SecureField("Password", text: $password)
                                .focused($inFocus, equals: .secure)
                        }
                        Button {
                            self.showPassword.toggle()
                            inFocus = showPassword ? .plain : .secure
                        } label: {
                            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(.darkGray))
                        }

                    }
                    Divider()
                        .background(Color(.darkGray))
                }
            }
        }

    }



struct CustomPasswordField_Previews: PreviewProvider {
    static var previews: some View {
        CustomPasswordField()
    }
}
