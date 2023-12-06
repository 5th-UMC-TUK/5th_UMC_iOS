//
//  Champs.swift
//  StudyMission
//
//  Created by 신예진 on 12/6/23.
//

import SwiftUI

struct TeamRanking: Identifiable {
    let id = UUID()
    let teamImage: String
    let teamName: String
    let position: Int
    let PL: Int
    let GD: String
    let PTS: Int
}


struct Champs: View {
    let championsLeagueRankingData: [TeamRanking] = [
        TeamRanking(teamImage: "hostpur", teamName: "Arsenal", position: 1, PL: 15, GD: "+19", PTS:36 ),
        TeamRanking(teamImage: "hostpur", teamName: "Liverpool", position: 2, PL: 14, GD: "+18", PTS:31 ),
        
        TeamRanking(teamImage: "hostpur", teamName: "Man City", position: 3, PL: 14, GD: "+20", PTS:30 ),
        
        TeamRanking(teamImage: "hostpur", teamName: "Aston Villa", position: 4, PL: 14, GD: "+13", PTS:29 ),
        
        TeamRanking(teamImage: "hostpur", teamName: "Tottenahm", position: 5, PL: 14, GD: "+8", PTS:27 ),
        
        TeamRanking(teamImage: "hostpur", teamName: "Newcastle", position: 6, PL: 14, GD: "+18", PTS:26 ),
        
        TeamRanking(teamImage: "hostpur", teamName: "Man United", position: 7, PL: 14, GD: "-1", PTS:24 ),
        
        TeamRanking(teamImage: "hostpur", teamName: "Brighton", position: 8, PL: 14, GD: "+4", PTS:22 ),
        
        TeamRanking(teamImage: "hostpur", teamName: "West Ham", position: 9, PL: 14, GD: "0", PTS:21 ),
        
        TeamRanking(teamImage: "hostpur", teamName: "Chelsea", position: 10, PL: 14, GD: "+3", PTS:19 ),
    ]
    
    //    var body: some View {
    //        NavigationView {
    //            ScrollView {
    //                VStack {
    //                    ForEach(championsLeagueRankingData) { teamRanking in
    //                        HStack {
    //                            Text("\(teamRanking.position)")
    //                                .font(.headline)
    //                                .foregroundColor(.white)
    //                                .frame(width: 30)
    //                            Image("hotspur")
    //                                .resizable()
    //                                .frame(width: 30, height: 30)
    //                            Text(teamRanking.teamName)
    //                                .foregroundColor(.white)
    //                            Spacer()
    //                            Text("PL: \(teamRanking.PL)")
    //                                .foregroundColor(.white)
    //                            Text("GD: \(teamRanking.GD)")
    //                                .foregroundColor(.white)
    //                            Text("PTS: \(teamRanking.PTS)")
    //                                .foregroundColor(.white)
    //                        }
    //                        .frame(maxWidth: .infinity)
    //                        .listRowInsets(EdgeInsets())
    //                    }
    //                }
    //                .background(Color.black)
    //                .listStyle(PlainListStyle())
    //                .navigationTitle("Premier League")
    //            }
    //        }
    //    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        HStack{
                            Text("TEAM")
                                .bold()
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("PL")
                                .foregroundColor(.white)
                                .bold()
                            //                                    .frame(width: 30)
                            Text("GD")
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: 30)
                            Text("PTS")
                                .foregroundColor(.white)
                                .bold()
                            //                                    .frame(width: 30)
                            
                        }.frame(maxWidth: .infinity)
                            .listRowInsets(EdgeInsets())
                            .padding(10)
                        
                        ForEach(championsLeagueRankingData) { teamRanking in
                            Button(action: {
                                // Perform action when button is tapped
                                // You can navigate to another view here
                                // For example:
                                // self.navigateToDetailView(with: teamRanking)
                            }) {
                                VStack {
                                    HStack {
                                        Text("\(teamRanking.position)")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .frame(width: 30)
                                        Image("hotspur")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        Text(teamRanking.teamName)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("\(teamRanking.PL)")
                                            .foregroundColor(.white)
                                            .frame(width: 30, height: 30)
                                        
                                        Text("\(teamRanking.GD)")
                                            .foregroundColor(.white)
                                        //                                                .frame(width: 20)
                                            .padding(.horizontal,5)
                                            .frame(width: 30, height: 30)
                                        Text("\(teamRanking.PTS)")
                                            .foregroundColor(.white)
                                            .frame(width: 30, height: 30)
                                        //                                                .frame(width: 20)
                                        
                                    }
                                    .frame(maxWidth: .infinity)
                                    .listRowInsets(EdgeInsets())
                                    .padding(10)
                                    
                                    
                                }
                                .frame(maxWidth: .infinity)
                                .listRowInsets(EdgeInsets())
                                .padding(10)
                                
                                
                            }
                        }
                    }
                }
            }
            .navigationTitle("Premier League")
            .navigationBarColor(.white)
        }
    }
    
}


extension View {
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor?
    
    init(backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = .black
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = true
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.barTintColor = self.backgroundColor
                })
        }
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}
