//
//  ProfileView.swift
//  LexxiStore
//
//  Created by Yerasyl on 02.05.2024.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    var body: some View {
//        if userIsLoggedIn {
//            contentWhenLoggedIn
//        } else {
            contentWhenNotLoggedIn
//        }
    }
    
    var contentWhenLoggedIn: some View {
        ZStack {
            Color("Green2")
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        HStack {
                            Text("Редактировать")
                                .foregroundColor(.white)
                                .padding(.top, 40)
                                .padding()
                        }
                    }
                   
                }
                
                Text("Привет, \(email)!")
                    .foregroundColor(.white)
                
                Button {
                    //
                } label: {
                    Text("Создать объявление")
                        .frame(width: 300, height: 40)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color("MyColor4"))
                            )
                }
                .padding()
                .offset(y: 100)
                
                Button {
                    //
                } label: {
                    Text("Купить рекламу")
                        .frame(width: 300, height: 40)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color("MyColor4"))
                            )
                }
                .padding(.top, 90)
                
                Button {
                    //
                } label: {
                    HStack {
                        Text("Ваши объявления")
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.top, 24)
                }
                
                
                Button {
                    //
                } label: {
                    HStack {
                        Text("Настройки")
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.top, 24)
                }
                
                Button {
                    //
                } label: {
                    HStack {
                        Text("Помощь")
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.top, 24)
                }
                
                Button {
                    //
                } label: {
                    HStack {
                        Text("Условия использования")
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.top, 24)
                }
                
                Button {
                    //
                } label: {
                    HStack {
                        Text("Политика конфиденциальности")
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.top, 24)
                }
                
                Button {
                    //
                } label: {
                    HStack {
                        Text("О приложении")
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.top, 24)
                }
                
                Button {
                    userIsLoggedIn = false
                } label: {
                    
                    Text("Выйти")
                        .foregroundColor(.white)
                        .bold()
                }.padding(.top, 24)
                   
                
                Spacer()
                
            }
        }.ignoresSafeArea()
    }
    
    var contentWhenNotLoggedIn: some View {
        ZStack {
            Color("Green2")
            
            RoundedRectangle (cornerRadius: 30, style: .continuous)
                .foregroundColor(Color("MyColor4"))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            
            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                            
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                            
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                
                Button {
                    register()
                } label: {
                    Text("Sign Up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color("MyColor4"))
                        )
                }
                .padding(.top)
                .offset(y: 100)
                
                Button {
                    login()
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
//                .onAppear {
//                    Auth.auth().addStateDidChangeListener { auth, user in
//                        if user != nil {
//                            userIsLoggedIn.toggle()
//                        }
//                    }
//                }
                
            }.frame(width: 350)
                
            
        }.ignoresSafeArea()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            userIsLoggedIn = true
        }
    }

    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            userIsLoggedIn = true
        }
    }
}

extension View {
    func placeholder<Content: View> (
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    
}

#Preview {
    ProfileView()
}
