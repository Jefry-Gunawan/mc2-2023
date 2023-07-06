//
//  Home.swift
//  mc2-2023
//
//  Created by Rania Ori Sumargo on 22/06/23.
//

import SwiftUI
import AVKit

struct Home: View {
    
    var size: CGSize
    var safeArea: EdgeInsets
    
    //view properties
    @State private var player: AVPlayer? = {
        if let bundle = Bundle.main.path(forResource: "video", ofType: "mp4") {
            return .init(url: URL(filePath: bundle))
        }
        
        return nil
    } ()
    
    @State private var showPlayerControls: Bool = false
    @State private var isPlaying: Bool = false
    @State private var timeoutTask: DispatchWorkItem?
    @State private var isFinishedPlaying: Bool = false
    
    //video seeker properties
    @GestureState private var isDragging: Bool = false
    @State private var isSeeking: Bool = false
    @State private var progress: CGFloat = 0
    @State private var lastDraggedProgress: CGFloat = 0

    var body: some View {
        VStack(spacing: 10) {
            let videoPlayerSize: CGSize = .init(width: size.width, height: size.height / 3.5)
            
            // custom video player
            ZStack {
                if let player {
                    CustomVideoPlayer(player: player)
                        .overlay {
                            Rectangle()
                                .fill(.black.opacity(0.4))
                                .opacity(showPlayerControls || isDragging ? 1 : 0)
                            //animating dragging state
                                .animation(.easeInOut(duration: 0.35), value: isDragging)
                                .overlay {
                                    PlayBackControls()
                                }
                            
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                showPlayerControls.toggle()
                            }
                            
                            //timing out controls, only if the video is playing
                            if isPlaying {
                                timeoutControls()
                            }
                        }
                        .overlay(alignment: .bottom) {
                            VideoSeekerView(videoPlayerSize)
                        }
                }
            }
            .frame(width: videoPlayerSize.width, height: videoPlayerSize.height)
            ConversationView()
        }
        .padding(.top, safeArea.top)
        .onAppear{
            //adding observer to update seeker when the video is playing
            player?.addPeriodicTimeObserver(forInterval: .init(seconds: 1, preferredTimescale: 1), queue: .main, using: { time in
                 //calculating video progress
                if let currentPlayerItem = player?.currentItem {
                    let totalDuration = currentPlayerItem.duration.seconds
                    guard let currentDuration = player?.currentTime().seconds else { return }
                    
                    let calculatedProgress = currentDuration / totalDuration
                    
                    if !isSeeking {
                        progress = calculatedProgress
                        lastDraggedProgress = progress
                    }
                    
                    if calculatedProgress == 1 {
                        //video finished playing
                        isFinishedPlaying = true
                        isPlaying = false
                    }
                }
            })
        }
    }
    
    //video seeker view
    @ViewBuilder
    func VideoSeekerView(_ videoSize: CGSize) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(.gray)
            
            Rectangle()
                .fill(.red)
                .frame(width: max(size.width * progress, 0))
        }
        .frame(height: 3)
        .overlay(alignment: .leading) {
            Circle()
                .fill(.red)
                .frame(width: 15, height: 15)
            //showing drag know only when dragging
                .scaleEffect(showPlayerControls || isDragging ? 1 : 0.001, anchor: progress * size.width > 15 ? .trailing : .leading)
            //for more dragging space
                .frame(width: 50, height: 50)
                .contentShape(Rectangle())
            //moving along side with gesture process
                .offset(x: size.width * progress)
                .gesture(
                    DragGesture()
                        .updating($isDragging, body: { _, out, _ in
                            out = true
                        })
                        .onChanged({ value in
                            //cancelling existing timeout task
                            if let timeoutTask {
                                timeoutTask.cancel()
                            }
                            
                            //calculating progess
                            let translationX: CGFloat = value.translation.width
                            let calculatedProgress = (translationX / videoSize.width) + lastDraggedProgress
                            
                            progress = max(min(calculatedProgress, 1), 0)
                            isSeeking = true
                        })
                        .onEnded({ value in
                            //storing last known progress
                            lastDraggedProgress = progress
                            //seeking video to dragged time
                            if let currentPlayerItem = player?.currentItem {
                                let totalDuration = currentPlayerItem.duration.seconds
                                
                                player?.seek(to: .init(seconds: totalDuration * progress, preferredTimescale: 1))
                                
                                //rescheduling timeout task
                                if isPlaying {
                                    timeoutControls()
                                }
                                
                                //releasing with slight delay
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    isSeeking = false
                                }
                            }
                        })
                )
                .offset(x: progress * videoSize.width > 15 ? -15 : 0)
                .frame(width: 15, height: 15)
        }
    }
    
    //playback controls view
    @ViewBuilder
    func PlayBackControls() -> some View {
        HStack(spacing: 25) {
//            Button {
//
//            } label: {
//                Image(systemName: "backward.end.fill")
//                    .font(.title2)
//                    .fontWeight(.ultraLight)
//                    .foregroundColor(.white)
//                    .padding(15)
//                    .background {
//                        Circle()
//                            .fill(.black.opacity(0.35))
//                    }
//            }
//            .disabled(true)
//            .opacity(0.6)
            
            Button {
                if isFinishedPlaying {
                    //set video to start and play again
                    isFinishedPlaying = false
                    player?.seek(to: .zero)
                    progress = .zero
                    lastDraggedProgress = .zero
                }
                
                // changing video status to play/pause based on user input
                if isPlaying {
                    //pause video
                    player?.pause()
                    //cancelling timeout task when the video is paused
                    if let timeoutTask {
                        timeoutTask.cancel()
                    }
                }
                else {
                    //play video
                    player?.play()
                    timeoutControls()
                }
                
                withAnimation(.easeInOut(duration: 0.2)) {
                    isPlaying.toggle()
                }
            } label: {
                // changing icon based on video status
                // changing icon when video was finished playing
                Image(systemName: isFinishedPlaying ? "arrow.clockwise" : (isPlaying ? "pause.fill" : "play.fill"))
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(15)
                    .background {
                        Circle()
                            .fill(.black.opacity(0.35))
                    }
            }
            .scaleEffect(1.1)
            
//            Button {
//
//            } label: {
//                Image(systemName: "forward.end.fill")
//                    .font(.title2)
//                    .fontWeight(.ultraLight)
//                    .foregroundColor(.white)
//                    .padding(15)
//                    .background {
//                        Circle()
//                            .fill(.black.opacity(0.35))
//                    }
//            }
        }
        //hiding controls when dragging
        .opacity(showPlayerControls && !isDragging ? 1 : 0)
        .animation(.easeInOut(duration: 0.2), value: showPlayerControls && !isDragging)
    }
    
    //timming oyt play back controls after some 2-5 seconds
    func timeoutControls() {
        // cancelling already pending timeout task
        if let timeoutTask {
            timeoutTask.cancel()
        }
        
        timeoutTask = .init(block: {
            withAnimation(.easeInOut(duration: 0.35)) {
                showPlayerControls = false
            }
        })
        
        //scheduling task
        if let timeoutTask {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: timeoutTask)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}

struct ConversationView : View {
    
    @State private var isShowingTooltip: Bool = false
    struct conversation: Identifiable {
        var id: UUID = .init()
        var name: String
        var convo: String
        var vocab: String?
        var personNumber: Int
        var toolTip: String
    }
    
    let conversationList: [conversation] = [
        .init(name:"Budi", convo: "Hello, my name is Budi. I like Mathematics and Physics very much. How about you?", vocab: "", personNumber: 1, toolTip: ""),
        .init(name: "Ayu", convo: "Hello Budi. Nice to meet you, I’m Ayu. I like English and Biology.", vocab: "", personNumber: 2, toolTip: ""),
        .init(name: "Budi", convo: "Do you take private classes for them?", vocab: "", personNumber: 1, toolTip: ""),
        .init(name: "Ayu", convo: "No, I like to study independently. I usually look for materials online. What about you?", vocab: "independently", personNumber: 2, toolTip: "independently adverb\n/ˌindəˈpendəntlē/\nmandiri\n1 in a way that is free from outside control or influence\n2 without outside help\n3 in a way that is not connected with another; individually"),
        .init(name: "Budi", convo: "I take a private class for Maths. I get more excercise materials from the private class.", vocab: "", personNumber: 1, toolTip: ""),
        .init(name: "Ayu", convo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", vocab: "", personNumber: 2, toolTip: ""),
        .init(name: "Budi", convo: "Quisque lacinia tortor vitae enim luctus, nec tincidunt nunc sagittis.", vocab: "", personNumber: 1, toolTip: ""),
        .init(name: "Ayu", convo: "Fusce viverra augue a magna aliquam, ut commodo nisi vehicula.", vocab: "", personNumber: 2, toolTip: ""),
        .init(name: "Budi", convo: "Phasellus non libero aliquet, ultricies urna nec, rhoncus libero.", vocab: "", personNumber: 1, toolTip: "")
    ]
    
    var body : some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("School Encounter")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 0)
                            .padding(.horizontal, 5)
                        Text("Video Transcript")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 5)
                        VStack(alignment: .leading) {
                            ForEach(conversationList) { conversation in
                                HStack {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(conversation.name)
                                            Spacer()
                                        }
                                        .padding(.vertical, 5)
                                        .frame(width: 60)
                                        Spacer()
                                    }
                                    HStack{
                                        if (conversation.vocab != "") {
                                            let split = conversation.convo.split(separator: conversation.vocab ?? "")
                                            Text(.init(split[0] + "**\(conversation.vocab ?? "nil")**" + split[1]))
                                                .onTapGesture {
                                                    if conversation.toolTip != "" {
                                                        isShowingTooltip.toggle()
                                                    }
                                                }
                                        }
                                        else {
                                            Text(conversation.convo)
                                                .onTapGesture {
                                                    if conversation.toolTip != "" {
                                                        isShowingTooltip.toggle()
                                                    }
                                                }
                                        }
                                        Spacer()
                                    }
                                    .padding(8)
                                    .background(conversation.personNumber == 1 ? Color("Blue") : Color("Pale Blue"))
                                    .cornerRadius(10)
                                    .overlay(alignment: .top) {
                                        if conversation.toolTip != "" && isShowingTooltip {
                                            GeometryReader { geometry in
                                                PopOver(text: conversation.toolTip)
                                                    .offset(y: -geometry.size.height-50)
                                            }
                                        }
                                    }
                                    .overlay(alignment: .topLeading) {
                                        Image(systemName: "arrowtriangle.left.fill")
                                            .font(.title2)
                                            .offset(x: -15, y: 5)
                                        //                                            .rotationEffect(.degrees(5))
                                            .foregroundColor(conversation.personNumber == 1 ? Color("Blue") : Color("Pale Blue"))
                                    }
                                }
                                .padding(.bottom, 5)
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 10)
                }
            }
        }
    }
}



struct PopOver : View {
    var text: String
    @State var size: CGSize = .zero
    
    var body : some View {
        VStack(alignment: .leading) {
            Text(text)
                .font(.system(size: 12))
//                .lineLimit(10)
        }
        .padding(10)
        .frame(maxHeight: 180)
        .fixedSize(horizontal: false, vertical: true)
        .background(Color("Light Yellow"))
        .cornerRadius(10)
        .shadow(radius: 5)
        .overlay(alignment: .bottomLeading) {
            Image(systemName: "arrowtriangle.down.fill")
                .font(.system(size:30))
                .offset(x:75, y: 15)
                .foregroundColor(Color("Light Yellow"))
        }
        
        
    }
}
