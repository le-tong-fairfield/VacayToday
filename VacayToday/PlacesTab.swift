//
//  PlacesTab.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 24/04/2022.
//

import SwiftUI

struct PlacesTab: View {
    var body: some View {
        ScrollView([.vertical], showsIndicators: false) {
            VStack(spacing: 20){
                
                ForEach(data){i in
                    VStack(alignment: .leading, spacing: 12){
                        Button(action: {
                            
                        }){
                            Image(i.image).resizable().frame(minWidth: 0,
                                                              maxWidth: .infinity,
                                                              minHeight: 0,
                                                              maxHeight: 150,
                                                              alignment: .topLeading)
                            .cornerRadius(20)
                        }
                        Text(i.name).fontWeight(.heavy
                        )
                        HStack(spacing:5){
                            Image(systemName:"calendar").renderingMode(.original)
                            Text(i.date).foregroundColor(.gray)
                        }
                    }
            }
            }
        }
        }
}
//            {
//
//            } {
//                ForEach(0..<10) {
//                    Text("Item \($0)")
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .frame(minWidth: 0,
//                               maxWidth: .infinity,
//                               minHeight: 0,
//                               maxHeight: .infinity,
//                               alignment: .topLeading)
//                        .background(Color.red)
//                }
//            }
//        }
//        .frame(height: 350)

struct PlacesTab_Previews: PreviewProvider {
    static var previews: some View {
        PlacesTab()
    }
}

