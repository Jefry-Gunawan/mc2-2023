//
//  OverviewViewTenses.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 26/06/23.
//

import SwiftUI

struct OverviewViewTenses: View {
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
                              PositiveFormView()
                              // MARK: Negative Form
                              NegativeFormView()
                              
                              //MARK: Question Form
                              QuestionFormView()
                              
                              
                              //MARK: Usage
                                  VStack(alignment: .leading) {
                                      Text("Usage")
                                          .fontWeight(.bold)
                                          .font(.title2)
                                          .padding(.top, 30)
                                          .padding(.bottom, 5)
                                         // .padding(.leading, 30)
                                      
                                      UsageView()
                                          .padding(.bottom, 20)
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

struct OverviewViewTenses_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OverviewViewTenses()
        }
    }
}
