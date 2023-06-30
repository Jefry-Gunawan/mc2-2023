import SwiftUI

struct SpeakingView: View {
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    
    @State var textOut = [("My ", Color.black), ("name ", Color.black), ("is Jeff", Color.black)]
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text(textOut.reduce("", { $0 + $1.0 + " " }))
                .foregroundColor(.blue)
                .overlay(
                    textOut.reduce(Text(""), { result, part in
                        result + Text(part.0)
                            .foregroundColor(part.1)
                        + Text(" ")
                    })
                )
                .font(.title)
                .bold()
            Text(speechRecognizer.transcript)
            
            Spacer()
            
            if isRecording {
                Button(action: {
                    speechRecognizer.stopTranscribing()
                    isRecording = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        checkTranscribe()
                    }
                }) {
                    ZStack {
                        Capsule()
                            .foregroundColor(Color.red)
                            .frame(width: 150, height: 60)
                        Text("Stop")
                            .foregroundColor(Color.white)
                            .font(.title)
                            .bold()
                    }
                    .padding(.bottom, 70)
                }
            } else {
                Button(action: {
                    speechRecognizer.startTranscribing()
                    isRecording = true
                }) {
                    ZStack {
                        Capsule()
                            .foregroundColor(Color("Dark Blue"))
                            .frame(width: 150, height: 60)
                        Text("Start")
                            .foregroundColor(Color.white)
                            .font(.title)
                            .bold()
                    }
                    .padding(.bottom, 70)
                }
            }
        }
        .padding()
    }
    
    func checkTranscribe() {
        let words = speechRecognizer.transcript.lowercased().components(separatedBy: " ")
        print(words)
        
        textOut = textOut.map { (word, color) in
            print(word.lowercased())
            if words.contains(word.lowercased()) {
                print(word)
                return (word, .black)
            } else {
                print(word + "red")
                return (word, .red)
            }
        }
    }
}

struct SpeakingView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakingView()
    }
}
