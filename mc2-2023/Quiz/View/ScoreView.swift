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
    @Namespace var animation
    var body: some View {
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
            if isPass {
               Text("Congratulations!")
                   .font(.system(size: 35, weight: .bold))
                   .foregroundColor(Color("Dark Blue"))
               
               Text("You've managed to pass the quiz and completed this chapter! To reveal your score, you can scratch the card above.")
                   .foregroundColor(Color("Dark Blue"))
                   .kerning(1.02)
                   .multilineTextAlignment(.center)
                   .padding(.vertical)
           } else {
               Text("Oh No!")
                   .font(.system(size: 35, weight: .bold))
                   .foregroundColor(Color("Dark Blue"))
               
               Text("Unfortunately, you didn't pass the quiz. It seems like you have not understand our material yet. Scratch the card above to know how you did on this quiz.")
                   .foregroundColor(Color("Dark Blue"))
                   .kerning(1.02)
                   .multilineTextAlignment(.center)
                   .padding(.vertical)
           }
            
            NavigationLink {
                SummaryView()
            } label: {
                Text("CONTINUE")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 17)
                    .frame(maxWidth: .infinity)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("Dark Blue"))
                    }
            }
            .padding(.top, 15)
            .navigationBarHidden(true)
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
                Image("cardbg")
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
                Image("trophy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
                
                Text("You Pass")
                    .font(.headline)
                    .foregroundColor(Color("Dark Blue"))
                
            } else {
                Image("sadduck")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
                
                Text("You Fail")
                    .font(.headline)
                    .foregroundColor(Color("Dark Blue"))
                
            }
            
            HStack{
                Image(systemName: "graduationcap.fill")
                Text("95")
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

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
