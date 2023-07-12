//
//
//
// Created by 
//

import SwiftUI

struct ChapterView: View {
    var body: some View {
            VStack {
                VStack{
                    Rectangle()
                        .fill(Color("Blue"))
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .padding(EdgeInsets(.init(top: 25, leading: -10, bottom: -10, trailing: -10)))
                    
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Spacer().frame(height: 10)
                            HStack{
                                Text(chapterList[0].tensesName)
                                    .font(.system(size: 10))
                                    .lineLimit(1)
                                    .padding(4)
                                    .frame(height: 20)
                                    .background(Color("White"))
                                    .cornerRadius(5)
                            }
                            Text(chapterList[0].description)
                                .font(.body)
                                .lineLimit(7)
                                .padding(.top, 10)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0))
                        
                        Image("Ducker")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                            .padding(.top, 75)
                            
                    }
                    .background(Color("Blue"))
                    .navigationTitle(chapterList[0].name)
                    .navigationBarTitleDisplayMode(.large)
                    .toolbarBackground(
                        Color("Blue"),
                        for: .navigationBar)
                    
                    .roundedCorner(30, corners: [.bottomLeft, .bottomRight])
                    
                    
                }.padding(EdgeInsets(.init(top: -100, leading: -2, bottom: 0, trailing: -2)))
                
                //VStack for List
                VStack {
                    NavigationLink(destination: OverviewView()) {
                        CardView(title: "Overview")
                    }
                    .padding(2)
                    
                    NavigationLink(destination: VideoView()) {
                        CardView(title: "Video")
                    }
                    .padding(2)
                    
                    NavigationLink(destination: SpeakingView()) {
                        CardView(title: "Speaking")
                    }
                    .padding(2)
                    
                    NavigationLink(destination: SummaryView(topicId: 1, chapterId: 1)) {
                        CardView(title: "Quiz")
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        topicID = 2
                        chapterID = 1
                    })
                    .padding(2)
                }
                .background(Color("White"))
                .padding(7)
            }.ignoresSafeArea()
        }
    }


struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChapterView()
        }
    }
}
