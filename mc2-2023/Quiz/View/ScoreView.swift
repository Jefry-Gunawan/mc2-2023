//
//  ScoreView.swift
//  mc2-2023
//
//  Created by Nattfeb on 26/06/23.
//

import SwiftUI

struct ScoreView: View {
    @State var expandCard: Bool = false
    @State var showContent: Bool = false
    @State var isPass: Bool = false
    @State var isScratched: Bool = false
    @Namespace var animation
    @State var score: Int = 0
    
    @Binding var showScoreModal: Bool
    
    @State var showQuizModal: Bool = true
    
    @Binding var userAnswer: [String]
    
    var body: some View {
        if showQuizModal {
            QuizView(showQuizModal: $showQuizModal, userAnswer: $userAnswer, score: $score, isPass: $isPass)
        } else {
            VStack{
                //Header
                HStack{
                    HStack{
                        Image(systemName: "medal.fill")
                        Text("Result")
                    }
                    .font(.title.bold())
                    .foregroundColor(Color("Dark Blue"))
                    Spacer()
                }
                
                CardView()
                
                //Footer Content
                if isScratched{
                    if isPass {
                        Text("Duck Yeah!")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(Color("Dark Blue"))
                        
                        Text("You've managed to pass the quiz and completed this chapter!")
                            .foregroundColor(Color("Dark Blue"))
                            .kerning(1.02)
                            .multilineTextAlignment(.center)
                            .padding(.vertical)
                    } else {
                        Text("Oh Duck!")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(Color("Dark Blue"))
                        
                        Text("Unfortunately, you didn't pass the quiz. It seems like you have not understand our material yet.")
                            .foregroundColor(Color("Dark Blue"))
                            .kerning(1.02)
                            .multilineTextAlignment(.center)
                            .padding(.vertical)
                    }

                    Button(action: {
                        self.showScoreModal.toggle()
                    }, label: {
                        Text("CONTINUE")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 17)
                            .frame(maxWidth: .infinity)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("Dark Blue"))
                            }
                    })
                    .padding(.top, 15)
                    .navigationBarHidden(true)
                }
            }
            .padding(15)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background{
                Color("Pale Blue")
                    .ignoresSafeArea()
            }
            .overlay(content: {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .opacity(showContent ? 1 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showContent = false
                        isScratched = true
                        
                        withAnimation(.easeInOut(duration: 0.35).delay(0.1)){
                            expandCard = false
                        }
                    }
                    .transition(.opacity)
                
            })
            .overlay(content: {
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    if expandCard{
                        ResultView(size: size)
                            .matchedGeometryEffect(id: "RESULT", in: animation)
                            .transition(.asymmetric(insertion: .identity, removal: .offset(x:1)))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .onAppear{
                                withAnimation(.easeInOut(duration: 0.35)){
                                    showContent = true
                                }
                            }
                    }
                }
                .padding(30)
            })
        }
    }
    
    
    @ViewBuilder
    func CardView()->some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            ScratchCardView(pointSize: 60) {
                //Result
                if !expandCard{
                    ResultView(size: size)
                        .matchedGeometryEffect(id: "RESULT", in: animation)
                }
                
            } overlay: {
                Image("scratch")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width * 0.95, height: size.width * 0.95, alignment: .topLeading)
                    .clipShape(Circle())
            } onFinish: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                        expandCard = true
                    }
                }
            }
            .frame(width: size.width, height: size.height, alignment: .center)
            .onAppear{
                withAnimation(.easeInOut(duration: 0.35)){
                    showContent = false
                }
            }
            
        }
        .padding(15)
    }
    
    @ViewBuilder
    func ResultView(size: CGSize)->some View{
        VStack(spacing: 18){
            if isPass{
                Image("Quiz_pass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
                
                Text("You Pass")
                    .font(.headline)
                    .foregroundColor(Color("Dark Blue"))
                
            } else {
                Image("Quiz_fail")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
                
                Text("You Fail")
                    .font(.headline)
                    .foregroundColor(Color("Dark Blue"))
                
            }
            
            HStack{
                Image(systemName: "graduationcap.fill")
                Text("\(score)")
            }
            .font(.callout.bold())
            .foregroundColor(Color("Dark Blue"))
        }
        .padding(20)
        .frame(width: size.width * 0.95, height: size.width * 0.95)
        .background{
            Circle()
                .fill(Color("Light Blue"))
        }
    }
}

//struct ScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreView()
//    }
//}
