import SwiftUI

struct SpeakingView: View {
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    
    @State var textOut = [("I", Color.black), ("like", Color.black), ("physics", Color.black), ("and", Color.black), ("mathematics", Color.black), ("very", Color.black), ("much", Color.black)]
    
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
                .multilineTextAlignment(.center)
            
            //            Text("^Read the sentences above^")
            Text(speechRecognizer.transcript)
            
            Spacer()
            
            if isRecording {
                Button(action: {
                    speechRecognizer.stopTranscribing()
                    isRecording = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        checkTranscribe()
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
        
        textOut = textOut.map { (word, color) in
            let trimmedWord = word.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            if tempTranscript.contains(trimmedWord) {
                print(word + "black")
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
