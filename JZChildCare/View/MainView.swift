//
//  MainView.swift
//  JZChildCare
//
//  Created by Jaafar Zubaidi  on 2/25/23.
//


import SwiftUI

struct MainView: View {
    
    @ObservedObject var vm: CoreDataViewModel
    @State var text = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State  var isLoginSuccessful: Bool = false
    var body: some View {
        NavigationStack(path: $vm.np) {
          
            GeometryReader{ge in
                ScrollView{
                    VStack(alignment: .center, spacing: 30) {
                        Text("Manager Only")
                            .foregroundColor(.black)
                            .font(.system(size: 35.0))
                            .font(.title)
                            .bold()
                            .padding(20)
                            .padding(.bottom)
                            .background(Capsule().foregroundColor(Color(red: 25, green: 3, blue: 0.25)))
                        HStack {
                            
                            TextField("Username", text: $username)
                                .font(.system(size: 16.0))
                                .padding(.vertical, 6.0)
                        }
                        .padding(.horizontal, 24.0)
                        .padding(.vertical, 6.0)
                        .background(Capsule().foregroundColor(Color(red: 0.9125, green: 0.9125, blue: 0.9125)))
                        .padding(.horizontal, 24.0)
                        .padding(.vertical, 6.0)
                        HStack {
                            
                            SecureField("Password", text: $password)
                                .font(.system(size: 16.0))
                                .padding(.vertical, 6.0)
                        }
                        .padding(.horizontal, 24.0)
                        .padding(.vertical, 6.0)
                        .background(Capsule().foregroundColor(Color(red: 0.9125, green: 0.9125, blue: 0.9125)))
                        
                        
                        .padding(.horizontal, 24.0)
                        .padding(.vertical, 6.0)
                        
                        
                        Button(action: {
                            
                            if self.username == "Jaafar" && self.password == "Apple" {
                                 self.isLoginSuccessful = true
                                
                                
                                
                            } else {
                                self.isLoginSuccessful = false
                                
                            }
                            
                        }){
                            Text("Login")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(5.0)
                            
                            
                        }.padding(50)
                        if isLoginSuccessful {
                            Text("You have successfully logged in.")
                                .foregroundColor(.green)
                                .bold()
                                .font(.system(size: 20.0))

                        } else {
                            Text("Login failed.")
                                .foregroundColor(.red)
                                .bold()
                                .font(.system(size: 20.0))
                        }
          
                        
                    }
                   
                    .padding(.top,100)
                    
                    
                }
                .background(Image("Backgroun2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 5))
            }
            .navigationDestination(isPresented: $isLoginSuccessful) {
                Home(vm: vm)
            }
            .navigationDestination(for: String.self) { _ in
                ShowSignIn(vm: vm)
            }
       
        }
       
    }
    func performLogin() -> Bool {
         // Perform login operation and return true if successful, false otherwise
         return false
     }

}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(vm: .init())
    }
}


