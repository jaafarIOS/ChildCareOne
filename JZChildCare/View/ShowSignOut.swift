//
//  ShowSignOut.swift
//  JZChildCare
//
//  Created by Jaafar Zubaidi  on 2/25/23.
//

import SwiftUI

struct ShowSignOut: View {
    @ObservedObject var vm: CoreDataViewModel

    var body: some View {
                VStack(alignment: .center, spacing: 40){
                    
                    Image("Backgroun2").cornerRadius(50)
                    VStack{
                        Text("Signed Out").bold().font(.largeTitle)
                        
                        Text("From JZ Child Car").bold()
                        
                        Text(Date(), style: .date)
                        Text(Date(), style: .time)
                    }.foregroundColor(.white)
                        .font(.title)
                        .padding(35)
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

struct ShowSignOut_Previews: PreviewProvider {
    static var previews: some View {
        ShowSignOut(vm: .init())
    }
}
