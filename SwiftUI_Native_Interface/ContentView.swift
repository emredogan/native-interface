//
//  ContentView.swift
//  SwiftUI_Native_Interface
//
//  Created by Emre Dogan on 02/08/2022.
//

import SwiftUI

enum Tab {
    case login
    case movies
}

struct ContentView: View {
    @State var selection: Tab = .login
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

    
    var body: some View {
        
        TabView(selection: $selection) {
            LoginView(tab: $selection)
                .tabItem {
                    Text("Login")
                    Image(systemName: "gear")
                }
                .tag(Tab.login)
            CollectionView()
                .tabItem {
                    Text("Movies")
                    Image(systemName: "house")
                }
                .tag(Tab.movies)
            
            
        }
        
        
    }
}

struct LoginView: View {
    @Binding var tab: Tab

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var password = ""
    @State private var birthYear: Double = 1900
    @State private var birthDay = 1.0
    @State private var birthMonth = "January"
    @State private var selectedGender = 0
    @State private var isToggle : Bool = false


    
    
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var body: some View {
                VStack{
                    TextField("First name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                        .padding(3)
                    
                    TextField("Last name", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                        .padding(3)
                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding(3)
                    
                    HStack {
                        Text("Birth Year")
                        Slider(value: $birthYear, in: 1900...2005)
                           
                        
                    }.padding()
                    Text("\(Int(birthYear))")
                        .bold()
                        .font(.system(size: 25))
                    GeometryReader { geometry in
                        HStack(alignment: .center) {
                            Picker("Please choose a day", selection: $birthMonth) {
                                ForEach(1..<32) {
                                    Text("\($0)")
                                }
                            }
                            .frame(maxWidth: geometry.size.width / 2)
                            .clipped()
                            .pickerStyle(.wheel)
        
                            Picker("Please choose a month", selection: $birthMonth) {
                                ForEach(months, id:\.self) {
                                    Text("\($0)")
                                }
                            }
                            .frame(maxWidth: geometry.size.width / 2)
                            .clipped()
                            .pickerStyle(.wheel)
                        }
                    }
        
                    HStack {
                        Text("Gender")
                        Picker("What is your gender?", selection: $selectedGender) {
                            Text("Male").tag(0)
                            Text("Female").tag(1)
                        }
                        .pickerStyle(.segmented)
                    }.padding(3)
                    
        
                    HStack {
                        Text("Accept terms and conditions")
                        Toggle(isOn: $isToggle){
                            Text("Switch")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                              }
                    }.padding(5)
        
                    Button {
                        self.tab = .movies
                        print("TAPPED")
                    } label: {
                        Text("SIGN UP")
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
        
        
                }
    }
}


struct CollectionView: View {
    private var data: [Int] = Array(1...20)
    private var colors: [Color] = [.red, .green, .blue, .yellow]
    
    private let adaptiveColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    
    var body: some View {
            
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(movies, id: \.self) { movie in
                        VStack(spacing: 15) {
                            Image(movie.image)
                                .resizable()
                                .frame(width: 150, height: 200, alignment: .center)
                            Text("\(movie.title)")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                        }
                        
                    }
                }
            }.padding()
            
           
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


