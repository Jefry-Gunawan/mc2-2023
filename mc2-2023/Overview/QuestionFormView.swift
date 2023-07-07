//
//  QuestionFormView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 08/07/23.
//

import SwiftUI

struct QuestionFormView: View {
    var body: some View {
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
    }
}

struct QuestionFormView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionFormView()
    }
}
