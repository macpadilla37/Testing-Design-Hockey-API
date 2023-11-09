//
//  ContentView.swift
//  Testing Design Hockey API
//
//  Created by Mac Padilla on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("NHLbackground")
                VStack {
                    Text("NHL APP")
                        .font(Font.custom("BlackOpsOne-Regular", size: 70))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .foregroundColor(Color.ui.NLOrange)
                    NavigationLink(destination: TabsView().navigationBarBackButtonHidden(true)) {
                        Image("NHLlogo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                    }
                    ZStack{
                        Rectangle()
                            .fill(.black)
                            .frame(width: 180, height: 30)
                            .cornerRadius(40)
                            .opacity(0.4)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                        Text("Tap Logo to Continue")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                    }
                }
            }
        }
    }
}



struct TabsView: View {
   
    var body: some View {
            TabView {
                HomeTabView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }            
                    .toolbarBackground(.black, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarColorScheme(.dark, for: .tabBar)
                
                GameTabView()
                    .tabItem {
                        Label("Games", systemImage: "hockey.puck.fill")
                    }
                    .toolbarBackground(.black, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarColorScheme(.dark, for: .tabBar)
                
                StandingTabView()
                    .tabItem {
                        Label("Standings", systemImage: "list.number")
                    }
                    .toolbarBackground(.black, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarColorScheme(.dark, for: .tabBar)
            }
    }
}

struct HomeTabView: View {
    @State private var showingSheetRoster = false
    @State private var showingSheetSchedule = false
    @State private var isPressedleft = false
    @State private var isFilled = false
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("TEAMS")
                        .font(Font.custom("BlackOpsOne-Regular", size: 50))
                        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 100))
                        .foregroundColor(.white)
                    Image("NHLlogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                }
                .background(.black)
                .ignoresSafeArea()
                List{
                    VStack(alignment: .leading){
                        NavigationLink {
                            VStack{
                                Text("Colorado Avalanche")
                                    .padding(EdgeInsets(top: 70, leading: 20, bottom: 0, trailing: 0))
                                    .font(Font.custom("BlackOpsOne-Regular", size: 50))
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                List{
                                    HStack{
                                        Text("Abbreviation:")
                                            .font(Font.custom("FjallaOne-Regular", size: 20))
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        Text("COL")
                                            .font(Font.custom("FjallaOne-Regular", size: 25))
                                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                    }
                                    HStack{
                                        Text("First Year Team Played:")
                                            .font(Font.custom("FjallaOne-Regular", size: 20))
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        Text("1996")
                                            .font(Font.custom("FjallaOne-Regular", size: 25))
                                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                    }
                                    HStack{
                                        Text("Stadium:")
                                            .font(Font.custom("FjallaOne-Regular", size: 20))
                                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                        Text("Ball Areana")
                                            .font(Font.custom("FjallaOne-Regular", size: 25))
                                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                    }
                                    Button("Roster"){
                                        showingSheetRoster = true
                                    }
                                    .font(Font.custom("FjallaOne-Regular", size: 30))
                                    .sheet(isPresented: $showingSheetRoster) {
                                        SheetViewRoster()
                                    }
                                    Button("Schedule"){
                                        showingSheetSchedule = true
                                    }
                                    .font(Font.custom("FjallaOne-Regular", size: 30))
                                    .sheet(isPresented: $showingSheetSchedule) {
                                        SheetViewSchedule()
                                    }
                                }
                                .background(.gray)
                                .scrollContentBackground(.hidden)
                                
                            }   .background(.black)
                                .ignoresSafeArea()
                        }label: {
                            Text("Colorado Avalanche")
                                .font(Font.custom("FjallaOne-Regular", size: 20))
                            Button(action: {
                                withAnimation {
                                    self.isPressedleft.toggle()
                                }
                            }) {
                                Image(systemName: isFilled ? "heart.fill" : "heart")
                                    .foregroundColor(isFilled ? .red : .black)
                                    .onTapGesture {
                                        isFilled.toggle()
                                    }
                            }
                        }
                    }
                }
                .background(.gray)
                .scrollContentBackground(.hidden)
            }
            .background(.black)
            .ignoresSafeArea()
        }.accentColor(Color.ui.NLOrange)

    }
}

struct GameTabView: View {
   // @ObservedObject var contentViewModel = ContentViewModel()
    var body: some View {
        NavigationView {
            HStack{
                Text("GAMES")
                    .font(Font.custom("BlackOpsOne-Regular", size: 50))
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 100))
                    //.foregroundColor(.white)
                Image("NHLlogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            }

        }
    }
}

struct StandingTabView: View {
   // @ObservedObject var contentViewModel = ContentViewModel()
    var body: some View {
        NavigationView {
            HStack{
                Text("STANDINGS")
                    .font(Font.custom("BlackOpsOne-Regular", size: 50))
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 20))
                    //.foregroundColor(.white)
                Image("NHLlogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}

struct SheetViewRoster: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("ROSTER")
            .font(Font.custom("BlackOpsOne-Regular", size: 50))
        List{
            HStack{
                Text("Jane Doe") //Player Name
                    .font(Font.custom("FjallaOne-Regular", size: 25))
                Text("D") //Position
                    .font(Font.custom("FjallaOne-Regular", size: 25))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                Text("12") //Number
                    .font(Font.custom("FjallaOne-Regular", size: 25))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            }
        }
        .background(.gray)
        .scrollContentBackground(.hidden)

        Button("Press to Dismiss") {
            dismiss()
        } .accentColor(Color.ui.NLOrange)
          .font(Font.custom("FjallaOne-Regular", size: 20))
    }
}
struct SheetViewSchedule: View {
    @Environment(\.dismiss) var dismiss
    var pushNotificationService = PushNotificationService()
    var body: some View {
        Text("SCHEDULE")
            .font(Font.custom("BlackOpsOne-Regular", size: 50))
        List{
            HStack{
                Text("VS") //vs or @
                    .font(Font.custom("FjallaOne-Regular", size: 15))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                Text("San Jose Sharks") //Team
                    .font(Font.custom("FjallaOne-Regular", size: 25))
                VStack{
                    Text("Nov 23") //Date
                        .font(Font.custom("FjallaOne-Regular", size: 15))
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                    Text("7:30") //Time
                        .font(Font.custom("FjallaOne-Regular", size: 15))
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                }
            }
        }
        .background(.gray)
        .scrollContentBackground(.hidden)
        Button("Push notifications for the Schedule") {
            pushNotificationService.scheduleNotification(
                title: "Colorado Avalanche",
                subtitle: "Your game Colorado v. Detroit is starting!"
            )
        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        .font(Font.custom("FjallaOne-Regular", size: 25))
        .accentColor(Color.ui.NLOrange)

        Rectangle()
            .fill(.black)
            .frame(width: 280, height: 2)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        
        Button("Press to Dismiss") {
            dismiss()
        } .accentColor(Color.ui.NLOrange)
        .font(Font.custom("FjallaOne-Regular", size: 20))
    }
}


extension Color {
    static let ui = Color.UI()
    
    struct UI {
         let NLOrange = Color("NHLlogoOrange")
         let LightOrange = Color("NHLlighterOrange")

    }
}

#Preview {
    ContentView()
}
