//
//  TopicsView.swift
//  mc2-2023
//
//  Created by Nattfeb on 22/06/23.
//

import SwiftUI

struct TopicsView: View {
    //Gesture Properties
    @State var offsetY: CGFloat = 0
    @State var currentIndex: CGFloat = 0
    var body: some View {
        NavigationStack {
            GeometryReader{
                let size = $0.size
                //Card sizing
                let cardSize = size.width * 0.8
                
                Image("sunset")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.9)
                
                LinearGradient(colors: [
                    .clear,
                    Color("Yellow").opacity(0.5),
                    Color("Yellow").opacity(0.85),
                    Color("Yellow")
                    
                ], startPoint: .bottom, endPoint: .top)
                .frame(height: 500)
                .frame(maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
                
                //Bottom gradient
                LinearGradient(colors: [
                    .clear,
                    Color("Blue").opacity(0.3),
                    Color("Blue").opacity(0.55),
                    Color("Blue")
                    
                ], startPoint: .top, endPoint: .bottom)
                .frame(height: 500)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
                
                HeaderView()
                
                VStack(spacing: 0) {
                    ForEach(topicList){topic in
                        TopicView(topic: topic, size: size)
                    }
                }
                .frame(width: size.width)
                .padding(.top, size.height - cardSize)
                .offset(y:offsetY)
                .offset(y: -currentIndex * cardSize)
            }
            .coordinateSpace(name: "SCROLL")
            .contentShape(Rectangle())
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        offsetY = value.translation.height * 0.4
                    }).onEnded({ value in
                        let translation = value.translation.height
                        
                        withAnimation(.easeInOut){
                            if translation > 0{
                                if currentIndex > 0 && translation > 100{
                                    currentIndex -= 1
                                }
                            }else{
                                if currentIndex  < CGFloat(topicList.count - 1) && -translation > 250{
                                    currentIndex += 1
                                }
                            }
                            offsetY = .zero
                        }
                    })
            )
            .preferredColorScheme(.light)
        }
    }
    
    
    //Header View
    @ViewBuilder
    func HeaderView()-> some View{
        VStack(alignment: .leading){
            Text("Welcome Learners!")
                .font(.custom(FontManager.Poppins.black, size: 32))
                .padding(.top)
                .foregroundColor(Color("White"))
            Text("Choose your desired topic")
                .font(.custom(FontManager.Poppins.black, size: 16))
                .foregroundColor(Color("White"))
            
            GeometryReader{
                let size = $0.size
                
                HStack(spacing: 0) {
                    ForEach(topicList){topic in
                        VStack(spacing: 15) {
                            Text(topic.topicTitle)
                                .font(.custom(FontManager.Poppins.black, size: 26))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("White"))
                            
                            Text(topic.difficulty)
                                .font(.custom(FontManager.Poppins.regular, size: 12))
                                .padding(.top, -18)
                                .foregroundColor(Color("White"))
                        }
                        .frame(width: size.width)                    }
                }
                .offset(x: currentIndex * -size.width)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.8), value: currentIndex)
            }
            .padding(.top, 120)
        }
        .padding(15)
    }
}

// Topic View
struct TopicView: View{
    var topic: Topic
    var size: CGSize
    var body: some View{
        let cardSize = size.width * 0.8
        let maxCardsDisplayed = size.width * 4
        GeometryReader{proxy in
            let _size = proxy.size
            //Animate
            let offset = proxy.frame(in: .named("SCROLL")).minY - (size.height - cardSize)
            let scale = offset <= 0 ? (offset / maxCardsDisplayed) : 0
            let reducedScale = 1 + scale
            let currentCardScale = offset / cardSize
            
            NavigationLink(destination: ChapterListView()) {
                Image(topic.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: _size.width, height: _size.height)
                // Update anchor based on current card scale
                    .scaleEffect(reducedScale < 0 ? 0.001 : reducedScale, anchor: .init(x:0.5, y: 1 - (currentCardScale / 2.5)))
                // Animate size when new topic is selected
                    .scaleEffect(offset > 0 ? 1 + currentCardScale : 1, anchor: .top)
                // Remove excess next view
                    .offset(y: offset > 0 ? currentCardScale * 200 : 0)
                // Make it more compact
                    .offset(y: currentCardScale * -130)
            }
        }
        .frame(height: cardSize)
    }
}

struct TopicsView_Previews: PreviewProvider {
    static var previews: some View {
        TopicsView()
    }
}
