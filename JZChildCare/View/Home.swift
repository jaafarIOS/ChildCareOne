//
//  Home.swift
//  JZChildCare
//
//  Created by Jaafar Zubaidi  on 2/25/23.
//

import SwiftUI
struct Home : View {
    
    @ObservedObject var vm: CoreDataViewModel
    @State var index = 0

    var body: some View{
        GeometryReader{_ in
            
            VStack{
                
                Image("Backgroun2")
                    .resizable()
                    .frame(width: 120, height: 100)
                    .cornerRadius(50)
                
                ZStack{
                    
                    LogOut(index: self.$index, vm: vm)
                    // changing view order...
                        .zIndex(Double(self.index))
                    // FIXME
                    LogIn(index: self.$index, vm: vm)
                       

                    
                }
                
                HStack(spacing: 20){
                    
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)
                    
                }
                .padding(.horizontal, 10)
                .padding(.top, 50)
                // because login button is moved 25 in y axis and 25 padding = 50
                VStack {
                    NavigationLink(destination: SignUpView(index: self.$index, vm: .init()), label: { Text("Sing Up")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .background(Color("Color1"))
                            .clipShape(Capsule())
                      .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                        
                    })
                }
            }
            .padding(.vertical)
            
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
       

    }
}

// Curve...

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            path.move(to: CGPoint(x: rect.width, y: 125))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
}


struct CShape1 : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            // left side curve...
            
            path.move(to: CGPoint(x: 0, y: 125))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    var child: ResultEntity
    static var previews: some View {
        Home(vm: .init())
           .preferredColorScheme(.dark)
    }
}
