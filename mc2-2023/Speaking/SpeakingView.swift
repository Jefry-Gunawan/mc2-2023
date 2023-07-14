import SwiftUI

struct SpeakingView: View {
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    
    @State private var changeText = false
    
//    @State var speakingVariable = [SpeakingTextVariable(text: "I"), SpeakingTextVariable(text: "like"), SpeakingTextVariable(text: "physics"), SpeakingTextVariable(text: "and"), SpeakingTextVariable(text: "mathematics"), SpeakingTextVariable(text: "very"), SpeakingTextVariable(text: "much")]
    
    @State var speakingVariable: [SpeakingTextVariable] = speakingVariable1
    
//    @State var speakingVariable: [SpeakingTextVariable] {
//        var out: [SpeakingTextVariable] = []
//        let text = "My name is John"
//        let tempTranscript = text.components(separatedBy: " ")
//
//        for i in tempTranscript {
//            let tempVar = SpeakingTextVariable(text: i)
//            out.append(tempVar)
//        }
//
//        return out
//    }
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            if isRecording == false {
                Text("Read the sentences below")
                    .padding(.bottom, 10)
            } else {
                Text("Press the stop button to check")
                    .padding(.bottom, 10)
            }
            
            if changeText {
                outputText()
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .onAppear(perform:  {
                        changeText = false
                    })
            } else {
                outputText()
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            
            
//            Text("^Read the sentences above^")
//            Text(speechRecognizer.transcript)
            
            Spacer()
            
            if isRecording {
                Button(action: {
                    isRecording = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        speechRecognizer.stopTranscribing()
                        checkTranscribe()
                        changeText = true
                    }
                }) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color.red)
                            .frame(width: 90, height: 90)
                        Circle()
                            .foregroundColor(Color.white)
                            .frame(width: 80, height: 80)
                        Rectangle()
                            .foregroundColor(Color.red)
                            .frame(width: 35, height: 35)
                            .cornerRadius(5)
                    }
                    .padding(.bottom, 70)
                }
            } else {
                Button(action: {
                    speechRecognizer.startTranscribing()
                    isRecording = true
                }) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("Dark Blue"))
                            .frame(width: 90, height: 90)
                        Image(systemName: "mic.fill")
                            .foregroundColor(Color.white)
                            .font(.system(size: 35))
                    }
                    .padding(.bottom, 70)
                }
            }
        }
        .padding()
    }
    
    func checkTranscribe() {
        let tempTranscript = speechRecognizer.transcript.lowercased().components(separatedBy: " ")
        print(tempTranscript)
        
//        speakingVariable = speakingVariable.map { out in
//            if tempTranscript.contains(out.text.lowercased()) {
//                return out.withColor(Color.green)
//            } else {
//                return out.withColor(Color.red)
//            }
//        }
        
        for i in 0..<speakingVariable.count {
            if tempTranscript.contains(speakingVariable[i].text.lowercased()) {
                speakingVariable[i].color = .green
            } else {
                speakingVariable[i].color = .red
            }
        }
        
        changeText = true
    }
    
    func outputText() -> some View{
        var output = Text("")
        
        for out in speakingVariable {
            let temp = Text(out.text + " ").foregroundColor(out.color)
            output = output + temp
        }
        
        return output
    }
}

struct SpeakingView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakingView()
    }
}
