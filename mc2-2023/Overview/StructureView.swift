import SwiftUI

struct FormView<Content: View, ExampleView: View>: View {
    var title: String
    var color: Color
    var content: Content
    var exampleView: ExampleView
    //var tenses: [Tenses]
    
    init(title: String, color: Color, @ViewBuilder content: () -> Content, @ViewBuilder exampleView: () -> ExampleView) {
        self.title = title
        self.color = color
        //self.tenses = []
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
                .padding(.vertical, 15)
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
    //var filteredTenses: [Tenses]
    
    var body: some View {
        FormView(title: "Positive Form", color: Color("Dark Blue")) {
                        HStack {
                            Spacer()
                            Text("S + V1 ")
                            Text("s/es")
                                .foregroundColor(Color("Dark Blue"))
                            Spacer()
                        }
//            if let tense = filteredTenses.first {
//                            let tensesAndExampleSplit = tense.positive.split(separator: "~~")
//                            let tensesSplit = tensesAndExampleSplit[0].split(separator: " ")
//                            let specialChar = tense.specialCharacters.split(separator: "\\")
//
//                            HStack {
//                                Spacer()
//                                ForEach(tensesSplit, id: \.self) { word in
//                                    if !specialChar.contains(word) {
//                                        Text(word)
//                                        //.fontWeight(.medium)
//                                    } else {
//                                        Text(word)
//                                            .foregroundColor(Color("Dark Blue"))
//                                    }
//                                    Spacer()
//                                }
//                            }
//                        }
                
            } exampleView: {
                VStack(alignment: .leading) {
                                        HStack {
                                            Text("He")
                                            Text("studies.")
                                                .foregroundColor(Color("Dark Blue"))
                                        }
                    
                                        HStack {
                                            Text("Annie")
                                            Text("eats.")
                                                .foregroundColor(Color("Dark Blue"))
                                        }
//                    let exampleTenseSentence = tensesAndExampleSplit[1].split(separator: "\\")
//                    ForEach(0..<exampleTenseSentence.count, id: \.self) { i in
//                        HStack {
//                            ForEach(exampleTenseSentence[i].split(separator: " "), id: \.self) { word in
//                                if !specialChar.contains(word) {
//                                    Text(word)
//                                } else {
//                                    Text(word)
//                                        .foregroundColor(Color("Dark Blue"))
//                                }
//                            }
//                        }
//                    }
                    
                //}
            }
        }
    }
}
    
    struct NegativeFormView: View {
        var body: some View {
            FormView(title: "Negative Form", color: .red) {
                HStack {
                    Spacer()
                    Text("S + Do/")
                    Text("Does")
                        .foregroundColor(.red)
                    Text("not")
                        .foregroundColor(.red)
                    Text("+ V1")
                    Spacer()
                }
            } exampleView: {
                VStack(alignment: .leading) {
                    HStack {
                        Text("He")
                        Text("does not")
                            .foregroundColor(.red)
                        Text("eat.")
                    }
                    
                    HStack {
                        Text("I")
                        Text("do not")
                            .foregroundColor(.red)
                        Text("eat.")
                    }
                }
            }
        }
    }
    
    struct QuestionFormView: View {
        var body: some View {
            FormView(title: "Question Form", color: Color("Dark Yellow")) {
                HStack {
                    Spacer()
                    Text("Do/")
                    Text("Does")
                        .foregroundColor(Color("Dark Yellow"))
                    Text("+ S + V1 ?")
                    Spacer()
                }
            } exampleView: {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Does")
                            .foregroundColor(Color("Dark Yellow"))
                        Text("he study?")
                    }
                    
                    HStack {
                        Text("Do")
                            .foregroundColor(Color("Dark Yellow"))
                        Text("you eat?")
                    }
                }
            }
        }
    }
    
    
    struct StructureView: View {
        //let tenses: [Tenses] = tensesList
        //var filteredTenses: [Tenses] = tensesList.filter { $0.id == 2 }
        
        var body: some View {
            VStack {
                //PositiveFormView(filteredTenses: filteredTenses)
                PositiveFormView()
                NegativeFormView()
                QuestionFormView()
            }
        }
    }
    
    struct StructureView_Previews: PreviewProvider {
        static var previews: some View {
            StructureView()
        }
    }
    
    
