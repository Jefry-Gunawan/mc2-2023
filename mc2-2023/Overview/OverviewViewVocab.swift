//
//  OverviewViewVocab.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 26/06/23.
//

import SwiftUI

struct OverviewViewVocab: View {
    var body: some View {
        ScrollView(.vertical){
            
            VStack(alignment: .leading) {
                Group{
                    Text("New Vocabularies")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.vertical, 20)
                }
                
                NewVocabView()
                    .padding(.bottom, 20)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 20)
            .background(.white)
            .cornerRadius(10)
            .padding(.bottom,5)
            
            
        }
        .padding(.horizontal, 10)
        .background(Color("Pale Blue"))
    }
}

struct OverviewViewVocab_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OverviewViewVocab()
        }
    }
}
