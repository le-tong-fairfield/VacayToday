//
//  LodgingTab.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 24/04/2022.
//

import SwiftUI

struct LodgingTab: View {
    var body: some View {
        ScrollView([.vertical], showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(lodgingData){i in
                    VStack(alignment: .leading, spacing: 12){
                    
                        ZStack(alignment: .bottom) {
                            Button(action: {
                            
                            }){
                            Image(i.image).resizable().frame(minWidth: 0,
                                                              maxWidth: .infinity,
                                                              minHeight: 0,
                                                              maxHeight: 150,
                                                              alignment: .topLeading)
                            .cornerRadius(20)
                            }
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(i.name)
                                    .font(.headline)
                                    Text(i.date)
                                    .font(.subheadline)
                            }
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.primary)
                        .background(Color.primary
                                        .colorInvert()
                                        .opacity(0.75))
                    }
                    HStack(spacing:5){
                        Image(systemName:"location").renderingMode(.original)
                        Text(i.location).foregroundColor(.gray)
                        }
                    }
                    }
                }
            }
        }
    }


struct LodgingTab_Previews: PreviewProvider {
    static var previews: some View {
        LodgingTab()
    }
}
