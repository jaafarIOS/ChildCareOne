//
//  ContentView.swift
//  JZChildCare
//
//  Created by Jaafar Zubaidi  on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: CoreDataViewModel = CoreDataViewModel()
    var body: some View {
       
                MainView(vm: vm)
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
