//
//  ShowSingInAndOut.swift
//  JZChildCare
//
//  Created by Jaafar Zubaidi  on 2/25/23.
//

import SwiftUI

struct ShowSignIn: View {
    @State var bol = false
    @ObservedObject var vm: CoreDataViewModel
    //    var child: ResultEntity
    var body: some View {
        
                VStack(alignment: .center, spacing: 50){
                    
                    Image("Backgroun2").cornerRadius(20)
                    
                    VStack{
                        Text("Signed IN")
                            .bold().font(.largeTitle)
                        
                        Text("Welcome in JZ Child Care").bold()
                        
                        Text(Date(), style: .date)
                        Text(Date(), style: .time)
                        
                    }.foregroundColor(.white)
                        .font(.title)
                        .padding(.bottom)
                        .background(
                            LinearGradient(
                                colors: [.orange, .red],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ).cornerRadius(50)
                        )
                    
                }.frame(width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                    .background(.teal)
                    .edgesIgnoringSafeArea(.bottom)
                
                
            }
        
        
    
}

struct ShowSingInAndOut_Previews: PreviewProvider {
    static var previews: some View {
        ShowSignIn(vm: .init())
           
    }
}
