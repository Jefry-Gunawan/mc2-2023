//
//
//
// Created by 
//

import SwiftUI

struct ChapterView: View {
    
    
    var body: some View {
        let chapterList: [Chapter] = {
            var chapters: [Chapter] = []
            
            
            if let topicId = topicID,
               let chapterId = chapterID {
                
                let filtered1 = chapterDf.filter(on: "topic_id", Int.self, {$0 == topicId})
                let filtered2 = filtered1.filter(on: "id", Int.self, {$0 == chapterId})
                
                for row in filtered2.rows {
                    if let name = row["name"] as? String,
                       let description = row["description"] as? String,
                       let tensesId = row["tenses_id"] as? Int,
                       let topicId = row["topic_id"] as? Int,
                       let vocabId = row["vocab_id"] as? String {
                        
                        let tensesfilter = tensesDf.filter(on: "id", Int.self, {$0 == tensesId})
                        
                        for tensesrow in tensesfilter.rows{
                            if let tensesname = tensesrow["name"] as? String{
                                let chapter = Chapter(name: name, description: description, tensesId: tensesId, topicId: topicId, vocabId: vocabId, tensesName: tensesname)
                                chapters.append(chapter)
                            }
                        }
                    }
                }
            }
            return chapters
        }()
        
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
                NavigationLink(destination: OverviewView(tensesId: chapterList[0].tensesId ,vocabId: chapterList[0].vocabId)) {
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
                
                NavigationLink(destination: SummaryView()) {
                    CardView(title: "Quiz")
                }
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
