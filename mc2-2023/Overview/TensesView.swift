//
//  TensesView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 07/07/23.
//

import SwiftUI

struct TensesView: View {
    var body: some View {
        VStack(alignment: .leading){
                  ScrollView(.vertical){
                          VStack(alignment: .leading) {
                              
                              Group {
                                  Text("Simple Present Tense")
                                      .fontWeight(.bold)
                                      .font(.title)
                                      .padding(.top, 20)
                                  Text("Sentence Structure")
                                      .fontWeight(.bold)
                                      .font(.title2)
                                      .padding(.top, 20)
                              }
                              
                              // MARK: Positive Form
                              VStack(alignment: .leading) {
                                  Text("Positive Form")
                                      .font(.headline)
                                      .fontWeight(.bold)
                                      .foregroundColor(Color(.gray))
                                      .padding(.leading, 15)
                                      .padding(.top, 10)
                                  HStack{
                                      Spacer()
                                      Text("S + V1 ")
                                      Text("s/es")
                                          .foregroundColor(Color("Dark Blue"))
                                      Spacer()
                                  }
                                  .font(.title)
                                  .fontWeight(.bold)
                                  .padding(.vertical, 15)
                                  Text("Example: ")
                                      .fontWeight(.bold)
                                      .padding(.leading, 15)
                                  HStack{
                                      Text("He")
                                      Text("studies.")
                                          .foregroundColor(Color("Dark Blue"))
                                  }
                                  .fontWeight(.semibold)
                                  .padding(.leading, 15)
                                  HStack{
                                      Text("Annie")
                                      Text("eats.")
                                          .foregroundColor(Color("Dark Blue"))
                                  }
                                  .fontWeight(.semibold)
                                  .padding(.bottom, 10)
                                  .padding(.leading, 15)
                              }
                              .background(Color("Light Gray"))
                              .cornerRadius(10)
                              .padding(.vertical, 5)
                              
                              // MARK: Negative Form
                              VStack(alignment: .leading) {
                                  Text("Negative Form")
                                      .font(.headline)
                                      .fontWeight(.bold)
                                      .foregroundColor(Color(.gray))
                                      .padding(.leading, 15)
                                      .padding(.top, 10)
                                  HStack{
                                      Spacer()
                                      Text("S + Do/")
                                      Text("Does")
                                          .foregroundColor(.red)
                                      Text("not")
                                          .foregroundColor(.red)
                                      Text("+ V1")
                                      Spacer()
                                  }
                                  .font(.title)
                                  .fontWeight(.bold)
                                  .padding(.vertical, 15)
                                  Text("Example: ")
                                      .fontWeight(.bold)
                                      .padding(.leading, 15)
                                  HStack{
                                      Text("He")
                                      Text("does not")
                                          .foregroundColor(.red)
                                      Text("eat.")
                                  }
                                  .fontWeight(.semibold)
                                  .padding(.leading, 15)
                                  HStack{
                                      Text("I")
                                      Text("do not")
                                          .foregroundColor(.red)
                                      Text("eat.")
                                  }
                                  .fontWeight(.semibold)
                                  .padding(.bottom, 10)
                                  .padding(.leading, 15)
                              }
                              .background(Color("Light Gray"))
                              .cornerRadius(10)
                              .padding(.vertical, 5)
                              
                              VStack(alignment: .leading) {
                                  Text("Question Form")
                                      .font(.headline)
                                      .fontWeight(.bold)
                                      .foregroundColor(Color(.gray))
                                      .padding(.leading, 15)
                                      .padding(.top, 10)
                                  HStack{
                                      Spacer()
                                      Text("Do/")
                                      Text("Does")
                                          .foregroundColor(Color("Dark Yellow"))
                                      Text("+ S + V1 ?")
                                      Spacer()
                                  }
                                  .font(.title)
                                  .fontWeight(.bold)
                                  .padding(.vertical, 15)
                                  Text("Example: ")
                                      .fontWeight(.bold)
                                      .padding(.leading, 15)
                                  HStack{
                                      Text("Does")
                                          .foregroundColor(Color("Dark Yellow"))
                                      Text("he study?")
                                  }
                                  .fontWeight(.semibold)
                                  .padding(.leading, 15)
                                  HStack{
                                      Text("Do")
                                          .foregroundColor(Color("Dark Yellow"))
                                      Text("you eat?")
                                  }
                                  .fontWeight(.semibold)
                                  .padding(.bottom, 10)
                                  .padding(.leading, 15)
                              }
                              .background(Color("Light Gray"))
                              .cornerRadius(10)
                              .padding(.vertical, 5)
                              
                              
                              
                              //USAGE
                                  VStack(alignment: .leading) {
                                      Text("Usage")
                                          .fontWeight(.bold)
                                          .font(.title2)
                                          .padding(.top, 30)
                                          .padding(.bottom, 5)
                                         // .padding(.leading, 30)
                                      Group{
                                          Text("1. To express habits")
                                              .fontWeight(.bold)
                                              .font(.title3)
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
                                          .padding(.bottom, 5)
                                      }
                                      .padding(.leading, 20)
                                      
                                      Group{
                                          Text("2. To give instructions")
                                              .fontWeight(.bold)
                                              .font(.title3)
                                          Text("      Example:")
                                              .fontWeight(.bold)
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
                                      .padding(.leading, 20)
                                      
                                      Group{
                                          Text("3. For general truths")
                                              .fontWeight(.bold)
                                              .font(.title3)
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
                                      
                                  }

                          }
                          .padding(.horizontal, 20)
                          .background(.white)
                          .cornerRadius(10)
                          .padding(.bottom,5)
                  }
              }
              .padding(.horizontal, 10)
              .background(Color("Pale Blue"))
        }

}

struct TensesView_Previews: PreviewProvider {
    static var previews: some View {
        TensesView()
    }
}
