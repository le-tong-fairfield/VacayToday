//
//  Itinerary.swift
//  VacayToday
//
//  Created by Le Lan Khanh on 23/04/2022.
//

import SwiftUI

struct Itinerary: View {
    
    @State var selectedTab = Tabs.FirstTab
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            HStack{
                Button(action: {
                    
                }) {
                    Image(systemName: "slider.horizontal.3")
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
            }
            
            Text("Your Trip").fontWeight(.heavy).font(.largeTitle).padding(.top, 15)
            HStack{
                HStack{
                    Text("Itinerary").fontWeight(.semibold).foregroundColor(selectedTab == .FirstTab ? Color.blue : Color.black)
                        .onTapGesture {
                            self.selectedTab = .FirstTab
                        }
                    Spacer()
                    Text("Places").fontWeight(.semibold).foregroundColor(selectedTab == .SecondTab ? Color.blue : Color.black)
                        .onTapGesture {
                            self.selectedTab = .SecondTab
                        }
                    Spacer()
                    Text("Food").fontWeight(.semibold).foregroundColor(selectedTab == .ThirdTab ? Color.blue : Color.black)
                        .onTapGesture {
                        self.selectedTab = .ThirdTab
                    }
                    Spacer()
                    Text("Lodging").fontWeight(.semibold).foregroundColor(selectedTab == .FourthTab ? Color.blue : Color.black)
                            .onTapGesture {
                                self.selectedTab = .FourthTab
                            }
                    Spacer()
                    Text("Transportation").fontWeight(.semibold).foregroundColor(selectedTab == .FifthTab ? Color.blue : Color.black)
                        .onTapGesture {
                        self.selectedTab = .FifthTab
                    }
                }
                Spacer()
            }.padding([.top], 30)
                .padding(.bottom, 15)
            
            if selectedTab == .FirstTab{
                FirstTabView()
            } else if selectedTab == .SecondTab{
                SecondTabView()
            } else if selectedTab == .ThirdTab{
                ThirdTabView()
            } else if selectedTab == .FourthTab{
                FourthTabView()
            } else {
                FifthTabView()
            }
            
        }.padding()
    }
}

struct Itinerary_Previews: PreviewProvider {
    static var previews: some View {
        Itinerary()
    }
}

struct FirstTabView : View {
    var body : some View {
        ItineraryTab()
    }
}

struct SecondTabView : View {
    var body : some View {
        PlacesTab()
    }
}

struct ThirdTabView : View {
    var body : some View {
        Text("ThirdTab")
    }
}

struct FourthTabView : View {
    var body : some View {
        Text("FourthTab")
    }
}

struct FifthTabView : View {
    var body : some View {
        Text("FifthTab")
    }
}
enum Tabs {
    case FirstTab
    case SecondTab
    case ThirdTab
    case FourthTab
    case FifthTab
    
}
            
