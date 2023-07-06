//
//  ScratchCardView.swift
//  mc2-2023
//
//  Created by Nattfeb on 26/06/23.
//

import SwiftUI

struct ScratchCardView<Content: View, Overlay: View>: View {
    var content: Content
    var overlay: Overlay
    //Properties
    var pointSize: CGFloat
    //Callback when card is fully scratched
    var onFinish: ()-> ()
    
    init(pointSize: CGFloat, @ViewBuilder content: @escaping()->Content, @ViewBuilder overlay: @escaping()->Overlay, onFinish: @escaping () -> Void) {
        self.content = content()
        self.overlay = overlay()
        self.pointSize = pointSize
        self.onFinish = onFinish
    }
    
    @State var isScratched: Bool = false
    @State var disableGesture: Bool = false
    @State var dragPoints: [CGPoint] = []
    @State var animateCard: [Bool] = [false, false]
    var body: some View {
        GeometryReader{proxy in
            let size = proxy.size
            
            ZStack{
                //How it works:
                //Mask the content bit by bit based on drag location
                //Thus it will start drawing the content view over the overlay view
                overlay
                    .opacity(disableGesture ? 0 : 1)
                
                content
                    .mask{
                        if disableGesture{
                            Rectangle()
                        } else{
                            PointShape(points: dragPoints)
                                .stroke(style: StrokeStyle(lineWidth: isScratched ? (size.width * 1.4) : pointSize, lineCap: .round, lineJoin: .round))
                        }
                    }
                    //adding gesture
                    .gesture(
                        DragGesture(minimumDistance: disableGesture ? 100000 : 0)
                            .onChanged({value in
                                //stopping animation when touched
                                if dragPoints.isEmpty{
                                    withAnimation(.easeInOut){
                                        animateCard[0] = false
                                        animateCard[1] = false
                                    }
                                    
                                }
                                //adding points
                                dragPoints.append(value.location)
                            })
                            .onEnded({_ in
                                if !dragPoints.isEmpty{
                                    withAnimation(.easeInOut(duration: 0.35)){
                                        isScratched = true
                                    }
                    
                                    //callback
                                    onFinish()
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35){
                                        disableGesture = true
                                    }
                                    
                                }
                            })
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .rotation3DEffect(.init(degrees: animateCard[0] ? 4 : 0), axis: (x: 1, y: 0, z: 0))
            .rotation3DEffect(.init(degrees: animateCard[1] ? 4 : 0), axis: (x: 0, y: 1, z: 0))
            .onAppear{
                DispatchQueue.main.async {
                    withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)){
                        animateCard[0] = true
                    }
                    
                    withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.8)){
                        animateCard[1] = true
                    }
                }
            }
            
        }
    }
}

//Custom path shape based on drag location
struct PointShape: Shape{
    var points: [CGPoint]
    //animation
    var animatableData: [CGPoint]{
        get{points}
        set{points = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        Path{path in
            if let first = points.first{
                path.move(to: first)
                path.addLines(points)
            }
        }
    }
}




struct ScratchCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
