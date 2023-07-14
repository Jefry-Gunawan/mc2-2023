import SwiftUI

struct FormView<Content: View, ExampleView: View>: View {
    var title: String
    var color: Color
    var content: Content
    var exampleView: ExampleView
    
    init(title: String, color: Color, @ViewBuilder content: () -> Content, @ViewBuilder exampleView: () -> ExampleView) {
        self.title = title
        self.color = color
        self.content = content()
        self.exampleView = exampleView()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color(.gray))
                .padding(.leading, 15)
                .padding(.top, 10)
            content
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 15)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .environment(\.sizeCategory, .large)
            Text("Example: ")
                .fontWeight(.bold)
                .padding(.leading, 15)
            exampleView
                .fontWeight(.semibold)
                .padding(.leading, 15)
                .padding(.bottom, 10)
        }
        .background(Color("Light Gray"))
        .cornerRadius(10)
        .padding(.vertical, 5)
    }
}

struct PositiveFormView: View {
    
    var tenses: Tenses
    
    func positiveFormText(tenses: Tenses) -> Text {
        var textArr: [[Text]] = [[], []]
        var output = Text("")
        let tensesAndExampleSplit = tenses.positive.split(separator: "~~")
        let tensesOnly = tensesAndExampleSplit[0]
        
        if tensesOnly.contains("\\") {
            let tensesSplit = tensesOnly.split(separator: "\\")
            for i in 0..<tensesSplit.count {
                let tenseWord = tensesSplit[i].split(separator: " ")
                for word in tenseWord {
                    let temp = Text(String(word) + " ")
                        .foregroundColor(isHighlighted(word: word, tenses: tenses) ? Color("Dark Blue") : .black)
                    textArr[i].append(temp)
                    output = output + temp
                }
                    output = output + Text("\n\n")
            }
        } else {
            let tensesWord = tensesOnly.split(separator: " ")
            for word in tensesWord {
                let temp = Text(String(word) + " ")
                    .foregroundColor(isHighlighted(word: word, tenses: tenses) ? Color("Dark Blue") : .black)
                output = output + temp

            }
        }
        return output
    }

    func positiveExample(tenses: Tenses) -> Text {
        var textArr: [[Text]] = [[], []]
        var output = Text("")
        
        let tensesAndExampleSplit = tenses.positive.split(separator: "~~")
        let exampleTenseSentence = tensesAndExampleSplit[1].split(separator: "\\")
        
        for i in 0..<exampleTenseSentence.count {
            for word in exampleTenseSentence[i].split(separator: " ") {
                let temp = Text(String(word) + " ")
                    .foregroundColor(isHighlighted(word: word, tenses: tenses) ? Color("Dark Blue") : .black)
                textArr[i].append(temp)
                output = output + temp
            }
                output = output + Text("\n")
        }
        
        return output
    }
    
    func isHighlighted(word: Substring, tenses: Tenses) -> Bool {
        var specialChar = tenses.specialCharacters.components(separatedBy: "\\")
        specialChar.removeAll(where: { $0 == "" })
        let lowercasedWord = word.lowercased()
        
        return specialChar.contains { specialWord in
            lowercasedWord.localizedCaseInsensitiveContains(specialWord)
        }
    }
    
    var body: some View {
        FormView(title: "Positive Form", color: Color("Dark Blue")) {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    positiveFormText(tenses: tenses)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .environment(\.sizeCategory, .large)
                    Spacer()
                }
            }
        } exampleView: {
            VStack(alignment: .leading) {
                positiveExample(tenses: tenses)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .environment(\.sizeCategory, .large)
            }
        }

    }
}

struct NegativeFormView: View {
    
    var tenses: Tenses
    
    func negativeFormText(tenses: Tenses) -> Text {
        var textArr: [[Text]] = [[], []]
        var output = Text("")
        let tensesAndExampleSplit = tenses.negative.split(separator: "~~")
        let tensesOnly = tensesAndExampleSplit[0]
        
        if tensesOnly.contains("\\") {
            let tensesSplit = tensesOnly.split(separator: "\\")
            for i in 0..<tensesSplit.count {
                let tenseWord = tensesSplit[i].split(separator: " ")
                for word in tenseWord {
                    let temp = Text(String(word) + " ")
                        .foregroundColor(isHighlighted(word: word, tenses: tenses) ? .red : .black)
                    textArr[i].append(temp)
                    output = output + temp
                }
                    output = output + Text("\n\n")
            }
        } else {
            let tensesWord = tensesOnly.split(separator: " ")
            for word in tensesWord {
                let temp = Text(String(word) + " ")
                    .foregroundColor(isHighlighted(word: word, tenses: tenses) ? .red : .black)
                
                output = output + temp
            }
        }
        return output
    }

    func negativeExample(tenses: Tenses) -> Text {
        var textArr: [[Text]] = [[], []]
        var output = Text("")
        
        let tensesAndExampleSplit = tenses.negative.split(separator: "~~")
        let exampleTenseSentence = tensesAndExampleSplit[1].split(separator: "\\")
        
        for i in 0..<exampleTenseSentence.count {
            for word in exampleTenseSentence[i].split(separator: " ") {
                let temp = Text(String(word) + " ")
                    .foregroundColor(isHighlighted(word: word, tenses: tenses) ? .red : .black)
                
                textArr[i].append(temp)
                output = output + temp
            }
                output = output + Text("\n")
        }
        
        return output
    }
    
    func isHighlighted(word: Substring, tenses: Tenses) -> Bool {
        let specialChar = tenses.specialCharacters.components(separatedBy: "\\")
        let lowercasedWord = word.lowercased()
        
        return specialChar.contains { specialWord in
            lowercasedWord.localizedCaseInsensitiveContains(specialWord)
        }
    }
    
    var body: some View {
        FormView(title: "Negative Form", color: .red) {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    negativeFormText(tenses: tenses)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .environment(\.sizeCategory, .large)
                    Spacer()
                }
            }
        } exampleView: {
            VStack(alignment: .leading) {
                negativeExample(tenses: tenses)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .environment(\.sizeCategory, .large)
            }
        }

    }
}

struct QuestionFormView: View {
    
    var tenses: Tenses
    
    func questionFormText(tenses: Tenses) -> Text {
        var textArr: [[Text]] = [[], []]
        var output = Text("")
        let tensesAndExampleSplit = tenses.question.split(separator: "~~")
        let tensesOnly = tensesAndExampleSplit[0]
        
        if tensesOnly.contains("\\") {
            let tensesSplit = tensesOnly.split(separator: "\\")
            for i in 0..<tensesSplit.count {
                let tenseWord = tensesSplit[i].split(separator: " ")
                for word in tenseWord {
                    let temp = Text(String(word) + " ")
                        .foregroundColor(isHighlighted(word: word, tenses: tenses) ? Color("Dark Yellow") : .black)
                    textArr[i].append(temp)
                    output = output + temp
                }
                    output = output + Text("\n\n")
            }
        } else {
            let tensesWord = tensesOnly.split(separator: " ")
            for word in tensesWord {
                let temp = Text(String(word) + " ")
                    .foregroundColor(isHighlighted(word: word, tenses: tenses) ? Color("Dark Yellow") : .black)
                
                output = output + temp
            }
        }
        return output
    }

    func questionExample(tenses: Tenses) -> Text {
        var textArr: [[Text]] = [[], []]
        var output = Text("")
        
        let tensesAndExampleSplit = tenses.question.split(separator: "~~")
        let exampleTenseSentence = tensesAndExampleSplit[1].split(separator: "\\")
        
        for i in 0..<exampleTenseSentence.count {
            for word in exampleTenseSentence[i].split(separator: " ") {
                let temp = Text(String(word) + " ")
                    .foregroundColor(isHighlighted(word: word, tenses: tenses) ? Color("Dark Yellow") : .black)
                
                textArr[i].append(temp)
                output = output + temp
            }
                output = output + Text("\n")
        }
        
        return output
    }
    
    func isHighlighted(word: Substring, tenses: Tenses) -> Bool {
        let specialChar = tenses.specialCharacters.components(separatedBy: "\\")
        let lowercasedWord = word.lowercased()
        
        return specialChar.contains { specialWord in
            lowercasedWord.localizedCaseInsensitiveContains(specialWord)
        }
    }
    
    var body: some View {
        FormView(title: "Question Form", color: Color("Dark Yellow")) {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    questionFormText(tenses: tenses)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .environment(\.sizeCategory, .large)
                    Spacer()
                }
            }
        } exampleView: {
            VStack(alignment: .leading) {
                questionExample(tenses: tenses)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .environment(\.sizeCategory, .large)
            }
        }

    }
}


struct StructureView: View {
    
    var tensesId: Int
    
    var body: some View {
        var tensesList: [Tenses] = {
            var tenses: [Tenses] = []
            let tenseId = tensesId
            
            for row in tensesDf.rows {
                if let id = row["id"] as? Int,
                   let name = row["name"] as? String,
                   let positive = row["positive"] as? String,
                   let negative = row["negative"] as? String,
                   let question = row["question"] as? String,
                   let usage = row["usage"] as? String,
                   let specialCharacters = row["special_characters"] as? String {
                    
                    if tenseId == id {
                        let tense = Tenses(name: name, positive: positive, negative: negative, question: question, usage: usage, specialCharacters: specialCharacters)
                        tenses.append(tense)
                    }
                }
            }
            
            return tenses
        }()
        
        
        VStack {
            if let tense = tensesList.first {
                PositiveFormView(tenses: tense)
                NegativeFormView(tenses: tense)
                QuestionFormView(tenses: tense)
            }
        }
    }
}

struct StructureView_Previews: PreviewProvider {
    static var previews: some View {
        StructureView(tensesId: 2)
    }
}


