//
//  ChapterListView.swift
//  mc2-2023
//
//  Created by Jefry Gunawan on 22/06/23.
//

import SwiftUI

struct ChapterListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(1...5, id: \.self) { i in
                    Button {
                        
                    } label: {
                        ZStack {
                            Text("")
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .clipShape(Circle())
                            Text("\(i)")
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color.white)
                                .background(Color.green)
                                .clipShape(Circle())
                                .font(.title)
                            }
                        }
                }
            }
            
            .navigationTitle("Classroom")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChapterListView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterListView()
    }
}
