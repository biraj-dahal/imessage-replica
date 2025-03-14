//
//  LoginView.swift
//  iMessage replica
//
//  Created by Biraj Dahal on 3/13/25.
//

import SwiftUI

struct LoginView: View {

    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.largeTitle)


            VStack {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
            }
            .textFieldStyle(.roundedBorder)
            .textInputAutocapitalization(.never)
            .padding(40)

            HStack {
                Button("Sign Up") {
                    print("Sign up user: \(email), \(password)")
                    authManager.signUp(email: email, password: password)

                }
                .buttonStyle(.borderedProminent)

                Button("Login") {
                    print("Login user: \(email), \(password)")
                    authManager.signIn(email: email, password: password)

                }
                .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    LoginView()
        .environment(AuthManager()) 
}

