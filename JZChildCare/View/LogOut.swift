//
//  LogOut.swift
//  JZChildCare
//
//  Created by Jaafar Zubaidi  on 2/25/23.
//

import SwiftUI

struct LogOut : View {
    @State var email = ""
    @State var password = ""
    @Binding var index : Int
    @ObservedObject var vm: CoreDataViewModel
    @State var signUpSuccess: Bool = false
    @State var bol = false
    
    var body: some View{
        
                ZStack(alignment: .bottom) {
                    
                    VStack (spacing: 15){
                        
                        HStack{
                            
                            Spacer(minLength: 0)
                            
                            VStack(spacing: 10){
                                
                                Text("LogOut")
                                    .foregroundColor(self.index == 1 ? .white : .gray)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Capsule()
                                    .fill(self.index == 1 ? Color.blue : Color.clear)
                                    .frame(width: 100, height: 5)
                            }
                        }
                        .padding(.top, 30)
                        
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
                                //                            .font(.system(size: 20, weight: .bold, design: .rounded))
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
                    .clipShape(CShape1())
                    // clipping the content shape also for tap gesture...
                    .contentShape(CShape1())
                    // shadow...
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
                    .onTapGesture {
                        
                        self.index = 1
                        
                    }
                    .cornerRadius(35)
                    .padding(.horizontal,20)
                    
                    
                    // Button...
                    
                    Button {
                        if vm.isCorrect(email: email, password: password) {
                            bol = true
                            vm.singTrue = false
                        }
                        
                    }
                label: {
                    
                    Text("Log Out")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                        .background(Color("Color1"))
                        .clipShape(Capsule())
                }
                    
                    // moving view down..
                .offset(y: 25)
                .navigationDestination(isPresented: $bol) {
                    ShowSignOut(vm: vm)
                    
                }
                    // hiding view when its in background...
                    // only button...
                .opacity(self.index == 1 ? 1 : 0)
                    
                    
                }
                
            
        }
    
}
struct LogOut_Previews: PreviewProvider {
    static var previews: some View {
        LogOut(index: .constant(0), vm: .init())
    }
}

