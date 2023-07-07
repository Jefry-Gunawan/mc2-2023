//
//  VocabView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 07/07/23.
//

import SwiftUI

struct VocabView: View {
    
    
    var body: some View {
            ScrollView(.vertical){
                
                VStack(alignment: .leading) {
                    
                    Text("New Vocabularies")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.vertical, 20)
                    
                    Group{
                        Text("1. Excercise")
                            .fontWeight(.bold)
                            .font(.title3)
                        HStack{
                            Text("  | ˈeksərˌsīz |")
                            Text("  noun")
                                .italic()
                        }
                        Text("     Example:")
                            .fontWeight(.bold)
                        HStack{
                            Text("     He ")
                            Text("excercises").foregroundColor(.red)
                            Text(" later.")
                        }
                        .fontWeight(.semibold)
                        HStack{
                            Text("     Annie ")
                            Text("does").foregroundColor(.red)
                            Text(" excercise.")
                        }
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    }
                    .padding(.leading, 20)
                    
                    Group{
                        Text("2. Sleep")
                            .fontWeight(.bold)
                            .font(.title3)
                        HStack{
                            Text("  | slēp |")
                            Text("  noun, verb")
                                .italic()
                        }
                        Text("      Example:")
                            .fontWeight(.bold)
                        HStack{
                            Text("      She ")
                            Text("sleeps").foregroundColor(.red)
                            Text(" in a bed.")
                        }
                        .fontWeight(.semibold)
                        HStack{
                            Text("      Aliquam ")
                            Text("blandit").foregroundColor(.red)
                            Text(" ante.")
                        }
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    }
                    .padding(.leading, 20)
                    
                    Group{
                        Text("3. Drink")
                            .fontWeight(.bold)
                            .font(.title3)
                        HStack{
                            Text("  | driNGk |")
                            Text("  noun, verb")
                                .italic()
                        }
                        Text("      Example:")
                            .fontWeight(.bold)
                        HStack{
                            Text("      Lorem ")
                            Text("ipsum").foregroundColor(.red)
                            Text(" dolor sit amet.")
                        }
                        .fontWeight(.semibold)
                        HStack{
                            Text("      Aliquam ")
                            Text("blandit").foregroundColor(.red)
                            Text(" ante.")
                        }
                        .fontWeight(.semibold)
                        .padding(.bottom, 20)
                    }
                    .padding(.leading, 20)
                    .background(.red)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .cornerRadius(10)
                .padding(.bottom,5)
                
                
            }
            .padding(.horizontal, 10)
            .background(Color("Pale Blue"))
    }
}

struct VocabView_Previews: PreviewProvider {
    static var previews: some View {
        VocabView()
    }
}
