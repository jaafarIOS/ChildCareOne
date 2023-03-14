//
//  ViewSome.swift
//  JZChildCare
//
//  Created by Jaafar Zubaidi  on 2/25/23.
//

import SwiftUI

struct ViewSome: View {
    @ObservedObject var vm: CoreDataViewModel
    @Binding var index : Int
    var child: ResultEntity
    var body: some View {

                VStack{
                    Image("Backgroun2").cornerRadius(50)
                    VStack{
                        Text("Congratulations").bold().font(.largeTitle)
                        Text("\(child.childFirstName ?? "") , \(child.childLastName ?? "")")
                        Text("on signing up with JZ Child Care.")
                            .frame(width: UIScreen.main.bounds.width - 60,height: 120,alignment: .center)
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
                }
            
        }
    
}

