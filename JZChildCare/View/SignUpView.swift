//
//  SignUpView.swift
//  JZChildCare
//
//  Created by Jaafar Zubaidi  on 2/25/23.
//

import SwiftUI

struct SignUpView : View {
    @State var childFirstName: String = ""
    @State var childLastName: String = ""
    @State var email = ""
    @State var password = ""
    @Binding var index : Int
    @ObservedObject var vm: CoreDataViewModel
    
    @State var signUpSuccess: Bool = false
    @State var alertDissmis: Bool = false
   
    var body: some View{
    
                
                ZStack(alignment: .bottom) {
                    
                    VStack{
                        
                        HStack{
                            
                            Spacer(minLength: 0)
                            
                            VStack(spacing: 10){
                                
                                Text("SignUp")
                                    .foregroundColor(Color("Color1"))
                                //self.index == 1 ? .white : .gray)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                //                        Capsule()
                                //                            .fill(self.index == 1 ? Color.blue : Color.clear)
                                //                            .frame(width: 100, height: 5)
                            }
                        }
                        .padding(.top, 30)// for top curve...
                        VStack{
                            
                            HStack(spacing: 15){
                                
                                Image(systemName: "face.dashed")
                                    .foregroundColor(Color("Color1"))
                                
                                TextField("Child First Name", text: self.$childFirstName)
                                    .foregroundColor(.black)
                                    .font(.title)
                            }
                            
                            Divider().background(Color.white.opacity(0.5))
                        }
                        .padding(.horizontal)
                        .padding(.top, 40)
                        VStack{
                            
                            HStack(spacing: 15){
                                
                                Image(systemName: "face.dashed")
                                    .foregroundColor(Color("Color1"))
                                
                                TextField("Child Last Name", text: self.$childLastName)
                                    .foregroundColor(.black)
                                    .font(.title)
                            }
                            
                            Divider().background(Color.white.opacity(0.5))
                        }
                        .padding(.horizontal)
                        .padding(.top, 40)
                        
                        VStack{
                            
                            HStack(spacing: 15){
                                
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(Color("Color1"))
                                
                                TextField("Email Address", text: self.$email)
                                    .foregroundColor(.black)
                                    .accentColor(.green)
                                    .font(.title)
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
                                    .foregroundColor(.black)
                                    .font(.title)
                                
                            }
                            
                            Divider().background(Color.white.opacity(0.5))
                        }
                        .padding(.horizontal)
                        .padding(.top, 30)
                        
                    }
                    .padding()
                    // bottom padding...
                    
                    .padding(.bottom, 65)
                    .background(.white)
                    //.background(Color("Color2"))
                    //.clipShape(CShape1())
                    // clipping the content shape also for tap gesture...
                    .contentShape(CShape1())
                    // shadow...
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
                    .onTapGesture {
                        
                        self.index = 1
                        
                    }
                    .cornerRadius(35)
                    .padding(.horizontal,20)
                    
                    // Button...
                    
                    Button {
                        // You need a function in your viewModel that will store
                        // a new entity and update you saveResults variable
                        
                        let newUser = ResultEntity(context: vm.container.viewContext)
                        newUser.childFirstName = childFirstName
                        newUser.childLastName = childLastName
                        newUser.password = password
                        newUser.email = email
                        do {
                            try vm.container.viewContext.save()
                            vm.saveResults.append(newUser)
                        } catch {
                            // handle error
                            print(error)
                        }
                        signUpSuccess = true
                        
                    } label: {
                        
                        Text("SIGN UP")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .background(Color("Color1"))
                            .clipShape(Capsule())
                        // shadow...
                            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                    }.padding(10.0)
                    //.navigationTitle("Sing Up")
                        .padding(10.0)
                        .alert(isPresented: $signUpSuccess) {
                            Alert(title: Text("Sign Up Successful"), message: Text("You have successfully signed up!"), dismissButton: .default(Text("OK")){
                                childFirstName = ""
                                childLastName = ""
                                email = ""
                                password = ""
                                
                                alertDissmis = true
                            }
                            )
                        }
                    
                    
                }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height, alignment: .center)
                    .background(.teal)
                    .navigationDestination(isPresented: $alertDissmis, destination: {
                        VStack {
                            if let lastEntity = vm.saveResults.last {
                                ViewSome(vm: vm, index: self.$index, child: lastEntity)
                                
                                Spacer()
                                HStack{
                                    NavigationLink(destination: LogIn(index: .constant(0), vm: vm),
                                                   
                                                   label: { Text("Log in")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(.vertical)
                                            .padding(.horizontal, 50)
                                            .background(Color("Color1"))
                                            .clipShape(Capsule())
                                            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                                        
                                    })
                                }
                                Spacer()
                                Spacer()
                                Button {
                                    vm.clearAllData()
                                }
                            label: {
                                Text("Claer")
                            }
                            }
                        }
                    })
        
        
    }
}

struct SingUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView( index: .constant(1), vm: .init())
    }
}

