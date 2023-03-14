//
//  LogIn.swift
//  JZChildCare
//
//  Created by Jaafar Zubaidi  on 2/25/23.
//

import SwiftUI
import CoreData
import UIKit
struct LogIn : View {
    
    @State var email = ""
    @State var password = ""
    @Binding var index : Int
    @ObservedObject var vm: CoreDataViewModel
    @State var bol = false
    
    var body: some View{
                
                ZStack(alignment: .bottom) {
                    
                    VStack(spacing: 20){
                        
                        HStack{
                            
                            VStack(spacing: 10){
                                
                                Text("Login")
                                    .foregroundColor(self.index == 0 ? .white : .gray)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Capsule()
                                    .fill(self.index == 0 ? Color.blue : Color.clear)
                                    .frame(width: 100, height: 5)
                            }
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.top, 30)// for top curve...
                        
                        VStack{
                            
                            HStack(spacing: 15){
                                
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(Color("Color1"))
                                
                                TextField("Email Address", text: self.$email)
                                    .foregroundColor(.white)
                                    .textFieldStyle(.plain)
                                    .placeholder (when: email.isEmpty) {
                                        Text("Email ")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                    }
                            }
                            
                            Divider().background(Color.white.opacity(0.5))
                        }
                        .padding(.horizontal)
                        .padding(.top, 40)
                        
                        VStack{
                            
                            HStack(spacing: 15){
                                
                                Image(systemName: "eye.slash.fill")
                                    .foregroundColor(Color("Color1"))
                                
                                SecureField("Password", text: self.$password)
                                    .foregroundColor(.white)
                                    .textFieldStyle(.plain)
                                    .placeholder (when: email.isEmpty) {
                                        Text("Password ")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                    }
                            }
                            
                            Divider().background(Color.white.opacity(0.5))
                        }
                        .padding(.horizontal)
                        .padding(.top, 40)
                    }
                    
                    .padding()
                    // bottom padding...
                    
                    .padding(.bottom, 65)
                    .background(Color("Color2"))
                    .clipShape(CShape())
                    .contentShape(CShape())
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                    .onTapGesture {
                        
                        self.index = 0
                        
                    }
                    .cornerRadius(35)
                    .padding(.horizontal,20)
                    
                    Button {
                        if vm.isCorrect(email: email, password: password) {
                            bol = true
                            vm.singTrue = false
                        }
                    } label: {
                        Text("Log In")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .background(Color("Color1"))
                            .clipShape(Capsule())
                    }
                    
                    
                }.offset(y: 25)
                // hiding view when its in background...
                    .navigationDestination(isPresented: $bol) {
                        ShowSignIn(vm: vm)
                        
                    }
                
                
             
    }
}
struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn( index: .constant(0), vm: .init())
    }
}
extension View{
    func placeholder<Content: View>(
        when shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
