//
//  OverviewViewVocab.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 26/06/23.
//

import SwiftUI

struct OverviewViewVocab: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            GeometryReader { geometry in
                ScrollView(.vertical){
                    VStack {
                        
                        //NEW VOCAB RECTANGLE
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(20)
                            .frame(width: geometry.size.width, height: 400)
                            .overlay(alignment: .top){
                                VStack(alignment: .leading) {
                                    Text("New Vocabularies")
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .padding(.vertical, 20)
                                        .padding(.leading, -45)
                                    
                                    Group{
                                        Text("1. Excercise")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("     Example:")
                                            .font(.headline)
                                        HStack{
                                            Text("     He ")
                                            Text("excercises").foregroundColor(.red)
                                            Text(" later.")
                                        }
                                        HStack{
                                            Text("     Annie ")
                                            Text("does").foregroundColor(.red)
                                            Text(" excercise.")
                                        }
                                        .padding(.bottom, 5)
                                    }
                                    .padding(.leading, -30)
                                    
                                    Group{
                                        Text("2. Sleep")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("      Example:")
                                            .font(.headline)
                                        HStack{
                                            Text("      She ")
                                            Text("sleeps").foregroundColor(.red)
                                            Text(" in a bed.")
                                        }
                                        HStack{
                                            Text("      Aliquam ")
                                            Text("blandit").foregroundColor(.red)
                                            Text(" ante.")
                                        }
                                        .padding(.bottom, 5)
                                    }
                                    .padding(.leading, -30)
                                    
                                    Group{
                                        Text("3. Drink")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("      Example:")
                                            .font(.headline)
                                        HStack{
                                            Text("      Lorem ")
                                            Text("ipsum").foregroundColor(.red)
                                            Text(" dolor sit amet.")
                                        }
                                        HStack{
                                            Text("      Aliquam ")
                                            Text("blandit").foregroundColor(.red)
                                            Text(" ante.")
                                        }
                                        .padding(.bottom, 5)
                                    }
                                    .padding(.leading, -30)
                                    
                                }
                                
                            }
                            .padding(.bottom, 10)
                    }
                }
            }
            
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
