//
//  OverviewView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 30/06/23.
//

import SwiftUI

struct OverviewView: View {
    
    @State private var currentSection = "Grammar"
    var section = ["Grammar", "Vocabulary"]
    
    var tensesId: Int
    var vocabId: String
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                Text("Overview")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(width: 300, height: 50)
                    .padding(.leading, -60)
                Picker("", selection: $currentSection) {
                    ForEach(section, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                
                if currentSection == "Grammar" {
                    OverviewViewTenses()
                } else if currentSection == "Vocabulary" {
                    OverviewViewVocab(vocabId: vocabId)
                }
            }
            .background(Color("Pale Blue"))
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(tensesId: 1, vocabId: "1//2//3//4")
    }
}
