//
//  NegativeFormView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 08/07/23.
//

import SwiftUI

struct NegativeFormView: View {
    var body: some View {
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
    }
}

struct NegativeFormView_Previews: PreviewProvider {
    static var previews: some View {
        NegativeFormView()
    }
}
