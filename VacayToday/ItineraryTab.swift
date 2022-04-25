//
//  ItineraryTab.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 24/04/2022.
//

import SwiftUI

struct ItineraryTab: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
        HStack(spacing:40){
            ZStack(alignment: .center){
                Capsule()
                    .fill(Color.cyan)
                    .frame(width: 160, height: 60)
                HStack(spacing:5){
                    Image(systemName:"calendar").renderingMode(.original)
                    Text("Mar 15, 2022").foregroundColor(.black)
                    
                }
                
            }
            Button(action: {
            
            }){
                Image(systemName: "plus.circle.fill").renderingMode(.original)
            }
        }
            
        ScrollView([.vertical], showsIndicators: false) {
            VStack(spacing: 20){
                ForEach(itineraryData){i in
                    HStack(spacing: 10){
                        Text(i.time).fontWeight(.heavy)
                        ZStack(alignment: .center) {
                            Button(action: {
                            
                            }){
                                HStack(alignment: .firstTextBaseline, spacing: 20 ) {
                                    VStack(alignment: .leading) {
                                        Text(i.activity).frame( alignment: .leading)
                                        .font(.headline)
                                        Text(i.description)
                                        .font(.subheadline)
                                    }
                                    .frame(width: 200, height: 80, alignment: .leading)
                                    .background(Color.cyan)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                          
                            }
                            
                            Spacer()
                        }
                            .padding(.leading)
                            
                    }
                        .padding(.horizontal)
                    
            }
            }
        }
    }
        }
}
}

struct ItineraryTab_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryTab()
    }
}
