//
//  ContentView.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 23/04/2022.
//

import SwiftUI

struct ContentView: View{
    var body: some View {
        
        TabView{
            Text("Home").tabItem{
                Image(systemName: "house").font(.title)
            }
            Text("Profile").tabItem{
                Image(systemName: "person.fill").font(.title)
            }
            
            Text("Explore").tabItem{
                Image(systemName: "heart.circle").font(.title)
            }
        
            }
        }
    }

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}
