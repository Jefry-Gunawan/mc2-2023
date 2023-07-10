//
//  UsageView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 08/07/23.
//

import SwiftUI

struct UsageView: View {
    
    let usage = [
    "1. To express habits",
    "2. To give instructions",
    "3. For general truths"
    ]
    
    var body: some View {
        
            VStack(alignment: .leading) {
                ForEach(usage, id: \.self) { item in
                    Text("\(item)")
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
            }
            .padding(.leading, 20)
    }
}

struct UsageView_Previews: PreviewProvider {
    static var previews: some View {
        UsageView()
    }
}
