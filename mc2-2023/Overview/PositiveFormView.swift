//
//  PositiveFormView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 08/07/23.
//

import SwiftUI

struct PositiveFormView: View {
    var body: some View {
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
    }
}

struct PositiveFormView_Previews: PreviewProvider {
    static var previews: some View {
        PositiveFormView()
    }
}
