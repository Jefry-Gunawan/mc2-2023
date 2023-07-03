//
//  OverviewViewTenses.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 26/06/23.
//

import SwiftUI

struct OverviewViewTenses: View {
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                ScrollView(.vertical){
                    VStack {
                        //RECTANGLE
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(20)
                            .frame(width: geometry.size.width, height: 1150)
                            .overlay(alignment: .top){
                                VStack(alignment: .leading) {
                                    Text("Simple Present Tense")
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .padding(.top, 20)
                                        .padding(.leading, 30)
                                    Text("Sentence Structure")
                                        .fontWeight(.bold)
                                        .font(.title2)
                                        .padding(.top, 20)
                                        .padding(.leading, 30)
                                    
                                    //BLUE RECTANGLE
                                    Group{
                                        Rectangle()
                                            .fill(Color("Light Gray"))
                                            .frame(width: 320, height: 120)
                                            .cornerRadius(10)
                                            .padding(.horizontal,40)
                                            .overlay(
                                                VStack(alignment: .leading) {
                                                    Text("Positive Form")
                                                        .font(.headline)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color(.gray))
                                                        .padding(.leading, -70)
                                                        .padding(.top, 10)
                                                    HStack{
                                                        Text("S + V1 ")
                                                        Text("s/es")
                                                            .foregroundColor(Color("Dark Blue"))
                                                    }
                                                    .font(.title)
                                                    .fontWeight(.bold)
                                                    .padding(.top, 5)
                                                    Spacer()
                                                }
                                            )
                                        Text("Example: ")
                                            .fontWeight(.bold)
                                            .padding(.horizontal, 50)
                                        HStack{
                                            Text("He")
                                            Text("studies")
                                                .foregroundColor(Color("Dark Blue"))
                                        }
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 50)
                                        HStack{
                                            Text("Annie")
                                            Text("eats")
                                                .foregroundColor(Color("Dark Blue"))
                                        }
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 50)
                                        .padding(.bottom, 10)
                                    }
                                    
                                    //RED RECTANGLE
                                    Group{
                                        Rectangle()
                                            .fill(Color("Light Gray"))
                                            .frame(width: 320, height: 120)
                                            .cornerRadius(10)
                                            .padding(.horizontal,40)
                                            .overlay(
                                                VStack(alignment: .leading) {
                                                    Text("Negative Form")
                                                        .font(.headline)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color(.gray))
                                                        .padding(.top, 10)
                                                    HStack{
                                                        Text("S + Do/")
                                                        Text("Does")
                                                            .foregroundColor(.red)
                                                        Text("not")
                                                            .foregroundColor(.red)
                                                        Text("+ V1")
                                                    }
                                                    .font(.title)
                                                    .fontWeight(.bold)
                                                    .padding(.top, 5)
                                                    Spacer()
                                                }
                                            )
                                        Text("Example: ")
                                            .fontWeight(.bold)
                                            .padding(.horizontal, 50)
                                        HStack{
                                            Text("He")
                                            Text("does not")
                                                .foregroundColor(.red)
                                            Text("eat.")
                                        }
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 50)
                                        HStack{
                                            Text("I")
                                            Text("do not")
                                                .foregroundColor(.red)
                                            Text("eat.")
                                        }
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 50)
                                        .padding(.bottom, 10)
                                    }
                                    
                                    //YELLOW RECTANGLE
                                    Group{
                                        Rectangle()
                                            .fill(Color("Light Gray"))
                                            .frame(width: 320, height: 120)
                                            .cornerRadius(10)
                                            .padding(.horizontal, 40)
                                            .overlay(
                                                VStack(alignment: .leading) {
                                                    Text("Question Form")
                                                        .font(.headline)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color(.gray))
                                                        .padding(.leading, -15)
                                                        .padding(.top, 10)
                                                    HStack{
                                                        Text("Do/")
                                                        Text("Does")
                                                            .foregroundColor(Color("Dark Yellow"))
                                                        Text("+ S + V1 ?")
                                                    }
                                                    .font(.title)
                                                    .fontWeight(.bold)
                                                    .padding(.top, 5)
                                                    Spacer()
                                                }
                                            )
                                        Text("Example: ")
                                            .fontWeight(.bold)
                                            .padding(.horizontal, 50)
                                        HStack{
                                            Text("Does")
                                                .foregroundColor(Color("Dark Yellow"))
                                            Text("he study?")
                                        }
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 50)
                                        HStack{
                                            Text("Do")
                                                .foregroundColor(Color("Dark Yellow"))
                                            Text("you eat?")
                                        }
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 50)
                                    }
                                    
                                    //USAGE
                                    Group{
                                        VStack(alignment: .leading) {
                                            Text("Usage")
                                                .fontWeight(.bold)
                                                .font(.title2)
                                                .padding(.top, 30)
                                                .padding(.bottom, 5)
                                                .padding(.leading, 30)
                                            Group{
                                                Text("1. To express habits")
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
                                            .padding(.leading, 30)
                                            
                                            Group{
                                                Text("2. To give instructions")
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
                                            .padding(.leading, 30)
                                            
                                            Group{
                                                Text("3. For general truths")
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
                                                .padding(.bottom, 10)
                                            }
                                            .padding(.leading, 30)
                                            
                                        }
                                    }
                                    
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

struct OverviewViewTenses_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OverviewViewTenses()
        }
    }
}
