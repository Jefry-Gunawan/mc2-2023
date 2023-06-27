//
//  ProgressBar.swift
//  mc2-2023
//
//  Created by Jefry Gunawan on 22/06/23.
//

import SwiftUI

struct ProgressBar: View {
    var progress : Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: geometry.size.width * 0.9, height: 30)
                    .foregroundColor(Color("Pale Blue").opacity(0.3))
                
                ZStack(alignment: .center) {
                    Capsule()
                        .frame(width: max(geometry.size.width * 0.12, CGFloat(self.progress) * geometry.size.width * 0.9),
                               height: 30)
                        .foregroundColor(Color.blue)
                    
                    Text(String(format: "%.0f%%", progress * 100))
                        .font(.headline)
                        .bold()
                        .foregroundColor(Color("Pale Blue"))
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 30)
    }
}


struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 0.5)
    }
}
