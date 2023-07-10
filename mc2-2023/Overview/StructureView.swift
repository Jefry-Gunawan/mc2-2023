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
                .padding(.vertical, 15)
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
    var body: some View {
        FormView(title: "Positive Form", color: Color("Dark Blue")) {
            HStack {
                Spacer()
                Text("S + V1 ")
                Text("s/es")
                    .foregroundColor(Color("Dark Blue"))
                Spacer()
            }
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
    var body: some View {
        VStack {
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

