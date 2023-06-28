//
//  OverviewViewTenses.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 26/06/23.
//

import SwiftUI

struct OverviewViewTenses: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                Text("Overview")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(width: 300, height: 100)
                    .padding(.leading, -60)
                
                
                GeometryReader { geometry in
                    ScrollView(.vertical){
                        VStack {
                            //SENTENCE STRUCTURE RECTANGLE
                            Rectangle()
                                .fill(.white)
                                .cornerRadius(40)
                                .frame(width: geometry.size.width, height: 1150)
                                .shadow(radius: 5, x: 0, y: 6)
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
                                                .fill(Color("Blue"))
                                            //.frame(width: geometry.size.width, height: calculateRectangleHeight(for: "Text", width: geometry.size.width))
                                                .frame(width: 360, height: 120)
                                                .cornerRadius(20)
                                                .padding(.horizontal,20)
                                                .overlay(
                                                    VStack(alignment: .leading) {
                                                        Text("Positive Form")
                                                            .font(.headline)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(Color(.gray))
                                                            .padding(.leading, -80)
                                                            .padding(.top, 10)
                                                        HStack{
                                                            Text("S + V1 ")
                                                            Text("s/es")
                                                                .foregroundColor(Color("Yellow"))
                                                        }
                                                        .font(.title)
                                                        .fontWeight(.bold)
                                                        .padding(.top, 5)
                                                        Spacer()
                                                    }
                                                )
                                            Text("Example: ")
                                                .fontWeight(.bold)
                                                .padding(.horizontal, 40)
                                            HStack{
                                                Text("He")
                                                Text("studies")
                                                    .foregroundColor(.red)
                                            }
                                            .padding(.horizontal, 40)
                                            HStack{
                                                Text("Annie")
                                                Text("eats")
                                                    .foregroundColor(.red)
                                            }
                                            .padding(.horizontal, 40)
                                        }
                                        
                                        //RED RECTANGLE
                                        Group{
                                            Rectangle()
                                                .fill(Color("Light Red"))
                                            //.frame(width: geometry.size.width, height: calculateRectangleHeight(for: "Text", width: geometry.size.width))
                                                .frame(width: 360, height: 120)
                                                .cornerRadius(20)
                                                .padding(.horizontal,20)
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
                                                                .foregroundColor(Color("Light Yellow"))
                                                            Text("not")
                                                                .foregroundColor(Color("Yellow"))
                                                            Text("+ V1")
                                                        }
                                                        .font(.largeTitle)
                                                        .fontWeight(.bold)
                                                        .padding(.top, 5)
                                                        Spacer()
                                                    }
                                                )
                                            Text("Example: ")
                                                .fontWeight(.bold)
                                                .padding(.horizontal, 40)
                                            HStack{
                                                Text("He")
                                                Text("does not")
                                                    .foregroundColor(.red)
                                                Text("eat.")
                                            }
                                            .padding(.horizontal, 40)
                                            HStack{
                                                Text("I")
                                                Text("do not")
                                                    .foregroundColor(.red)
                                                Text("eat.")
                                            }
                                            .padding(.horizontal, 40)
                                        }
                                        
                                        //YELLOW RECTANGLE
                                        Group{
                                            Rectangle()
                                                .fill(Color("Light Yellow"))
                                            //.frame(width: geometry.size.width, height: calculateRectangleHeight(for: "Text", width: geometry.size.width))
                                                .frame(width: 360, height: 120)
                                                .cornerRadius(20)
                                                .padding(.horizontal, 20)
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
                                                                .foregroundColor(Color("Dark Blue"))
                                                            Text("+ S + V1 ?")
                                                        }
                                                        .font(.largeTitle)
                                                        .fontWeight(.bold)
                                                        .padding(.top, 5)
                                                        Spacer()
                                                    }
                                                )
                                            Text("Example: ")
                                                .fontWeight(.bold)
                                                .padding(.horizontal, 40)
                                            HStack{
                                                Text("Does")
                                                    .foregroundColor(.red)
                                                Text("he study?")
                                            }
                                            .padding(.horizontal, 40)
                                            HStack{
                                                Text("Do")
                                                    .foregroundColor(.red)
                                                Text("you eat?")
                                            }
                                            .padding(.horizontal, 40)
                                        }
                                        
                                        //USAGE
                                        Group{
                                            VStack(alignment: .leading) {
                                                Text("Usage")
                                                    .fontWeight(.bold)
                                                    .font(.title2)
                                                    .padding(.top, 40)
                                                    .padding(.bottom, 10)
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
                                                    .padding(.bottom, 5)
                                                }
                                                .padding(.leading, 30)
                                                
                                            }
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.bottom, 10)
                            
                            //BUTTON CONTINUE
                            NavigationLink(destination: OverviewViewVocab()){
                                Text("CONTINUE")
                                    .frame(width: 360, height: 40)
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color("Dark Blue"))
                                
                            }
                            .frame(width: 340, height: 50)
                            .cornerRadius(10)
                            .padding(.top, 20)
                            .shadow(radius: 10, x: 0, y: 6)
                        }
                    }
                }
                
            }
            .padding(.horizontal, 10)
            .background(Color("Pale Blue"))
        }
    }
}

struct OverviewViewTenses_Previews: PreviewProvider {
    static var previews: some View {
        OverviewViewTenses()
    }
}
