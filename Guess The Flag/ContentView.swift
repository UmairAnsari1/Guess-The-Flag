//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Umair on 27/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Spain","UK","Ukraine","US"].shuffled()
    @State private var correcAnsawer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color : Color( red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color : Color( red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack{
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing : 15){
                    VStack{
                        Text("Tap the Flag")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correcAnsawer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach (0..<3){ number in
                        Button{
                            flagTapped(number)
                        } label : {
                            Image(countries[number])
                                .clipShape(.buttonBorder)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score : ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
                    .padding()
            }
            .alert(scoreTitle, isPresented: $showingScore){
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your Score is ???")
            }
    }
    func flagTapped(_ number : Int){
        if number == correcAnsawer{
            scoreTitle = "Correct Ansawer"
        } else{
            scoreTitle = "You pick the wrong Flag"
        }
        
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correcAnsawer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
