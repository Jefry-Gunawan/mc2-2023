//
//  VideoView.swift
//  mc2-2023
//
//  Created by Rania Ori Sumargo on 22/06/23.
//

import SwiftUI

struct VideoView: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            
            Home(size: size, safeArea: safeArea)
                .ignoresSafeArea()
        }
        .navigationTitle("Video")
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VideoView()
        }
    }
}
