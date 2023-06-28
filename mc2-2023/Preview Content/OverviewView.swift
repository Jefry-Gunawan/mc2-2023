//
//  OverviewView.swift
//  mc2-2023
//
//  Created by Shalomeira Winata on 21/06/23.
//

import SwiftUI

struct OverviewView: View {
    @State private var overlayHeight: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Simple Present Tense")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(width: 300, height: 100)
            
            GeometryReader { geometry in
                ScrollView(.vertical){
                    VStack {
                        
                        //SENTENCE STRUCTURE RECTANGLE
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(40)
                            .frame(width: geometry.size.width, height: 700)
                            .overlay(alignment: .top){
                                VStack(alignment: .leading) {
                                    Text("Sentence Structure")
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .padding(.top, 20)
                                        .padding(.leading, 30)
                                    
                                    
                                    //BLUE RECTANGLE
                                    Group{
                                        Rectangle()
                                            .fill(Color("Blue"))
                                            //.frame(width: geometry.size.width, height: calculateRectangleHeight(for: "Text", width: geometry.size.width))
                                            .frame(width: 360, height: 120)
                                            .cornerRadius(20)
                                            .padding(.horizontal,20)
                                            .overlay(
                                                VStack(alignment: .leading) {
                                                    Text("Positive Form")
                                                        .font(.headline)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color(.gray))
                                                        .padding(.leading, -80)
                                                        .padding(.top, 10)
                                                    HStack{
                                                        Text("S + V1 ")
                                                        Text("s/es")
                                                            .foregroundColor(Color("Yellow"))
                                                    }
                                                    .font(.largeTitle)
                                                    .fontWeight(.bold)
                                                    .padding(.top, 5)
                                                    Spacer()
                                                }
                                            )
                                        Text("Example: ")
                                            .fontWeight(.bold)
                                            .padding(.horizontal, 40)
                                        HStack{
                                            Text("He")
                                            Text("studies")
                                                .foregroundColor(.red)
                                        }
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 40)
                                        HStack{
                                            Text("Annie")
                                            + Text("eats")
                                                .foregroundColor(.red)
                                        }
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 40)
                                    }
                                    
                                    //RED RECTANGLE
                                    Group{
                                        Rectangle()
                                            .fill(Color("Light Blue"))
                                            //.frame(width: geometry.size.width, height: calculateRectangleHeight(for: "Text", width: geometry.size.width))
                                            .frame(width: 360, height: 120)
                                            .cornerRadius(20)
                                            .padding(.horizontal,20)
                                            .overlay(
                                                VStack(alignment: .leading) {
                                                    Text("Negative Form")
                                                        .font(.headline)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color(.gray))
                                                        .padding(.top, 10)
                                                    HStack{
                                                        Text("S + Do/")
                                                        Text("Does")
                                                            .foregroundColor(Color("Light Yellow"))
                                                        Text("not")
                                                            .foregroundColor(Color("Yellow"))
                                                        Text("+ V1")
                                                    }
                                                    .font(.largeTitle)
                                                    .fontWeight(.bold)
                                                    .padding(.top, 5)
                                                    Spacer()
                                                }
                                            )
                                        Text("Example: ")
                                            .fontWeight(.bold)
                                            .padding(.horizontal, 40)
                                        HStack{
                                            Text("He")
                                            Text("does not")
                                                .foregroundColor(.red)
                                            Text("eat.")
                                        }
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 40)
                                        HStack{
                                            Text("I")
                                            Text("do not")
                                                .foregroundColor(.red)
                                            Text("eat.")
                                        }
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 40)
                                    }
                                    
                                    //YELLOW RECTANGLE
                                    Group{
                                        Rectangle()
                                            .fill(Color("Light Yellow"))
                                            //.frame(width: geometry.size.width, height: calculateRectangleHeight(for: "Text", width: geometry.size.width))
                                            .frame(width: 360, height: 120)
                                            .cornerRadius(20)
                                            .padding(.horizontal, 20)
                                            .overlay(
                                                VStack(alignment: .leading) {
                                                    Text("Question Form")
                                                        .font(.headline)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color(.gray))
                                                        .padding(.leading, -15)
                                                        .padding(.top, 10)
                                                    HStack{
                                                        Text("Do/")
                                                        Text("Does")
                                                            .foregroundColor(Color("Blue"))
                                                        Text("+ S + V1 ?")
                                                    }
                                                    .font(.largeTitle)
                                                    .fontWeight(.bold)
                                                    .padding(.top, 5)
                                                    Spacer()
                                                }
                                            )
                                        Text("Example: ")
                                            .fontWeight(.bold)
                                            .padding(.horizontal, 40)
                                        HStack{
                                            Text("Does")
                                                .foregroundColor(.red)
                                            Text("he study?")
                                        }
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 40)
                                        HStack{
                                            Text("Do")
                                                .foregroundColor(.red)
                                            Text("you eat?")
                                        }
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 40)
                                    }
                                    
                                }
                                //                        .alignmentGuide(.overlayHeight) { dimension in
                                //                            DispatchQueue.main.async {
                                //                                overlayHeight = dimension.height
                                //                            }
                                //                            return dimension[.top]
                                //                        }
                            }
                            .padding(.bottom, 10)
                        //                    .onAppear {
                        //                        overlayHeight = geometry.size.height
                        //                    }
                        
                        
                        //USAGE RECTANGLE
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(40)
                            .frame(width: geometry.size.width, height: 400)
                            .overlay(alignment: .top){
                                VStack(alignment: .leading) {
                                    Text("Usage")
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .padding(.vertical, 20)
                                        .padding(.trailing, 220)
                                    Group{
                                        Text("1. To express habits")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("      Example:")
                                            .font(.headline)
                                        HStack{
                                            Text("      Lorem ")
                                            Text("ipsum").foregroundColor(.red)
                                            Text(" dolor sit amet.")
                                        }
                                        HStack{
                                            Text("      Aliquam ")
                                            Text("blandit").foregroundColor(.red)
                                            Text(" ante.")
                                        }
                                        .padding(.bottom, 5)
                                        
                                    }
                                    Group{
                                        Text("2. To give instructions")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("      Example:")
                                            .font(.headline)
                                        HStack{
                                            Text("      Lorem ")
                                            Text("ipsum").foregroundColor(.red)
                                            Text(" dolor sit amet.")
                                        }
                                        HStack{
                                            Text("      Aliquam ")
                                            Text("blandit").foregroundColor(.red)
                                            Text(" ante.")
                                        }
                                        .padding(.bottom, 5)
                                    }
                                    Group{
                                        Text("3. For general truths")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("      Example:")
                                            .font(.headline)
                                        HStack{
                                            Text("      Lorem ")
                                            Text("ipsum").foregroundColor(.red)
                                            Text(" dolor sit amet.")
                                        }
                                        HStack{
                                            Text("      Aliquam ")
                                            Text("blandit").foregroundColor(.red)
                                            Text(" ante.")
                                        }
                                        .padding(.bottom, 5)
                                    }
                                }
                            }
                            .padding(.bottom, 10)
    
                        
                        //NEW VOCAB RECTANGLE
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(40)
                            .frame(width: geometry.size.width, height: 400)
                            .overlay(alignment: .top){
                                VStack(alignment: .leading) {
                                    Text("New Vocabularies")
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .padding(.vertical, 20)
                                        .padding(.trailing, 80)
                                    Group{
                                        Text("1. Excercise")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("      Example:")
                                            .font(.headline)
                                        HStack{
                                            Text("      He ")
                                            Text("excercises").foregroundColor(.red)
                                            Text(" later.")
                                        }
                                        HStack{
                                            Text("      Annie ")
                                            Text("does").foregroundColor(.red)
                                            Text(" excercise.")
                                        }
                                        .padding(.bottom, 5)
                                    }
                                    Group{
                                        Text("2. Sleep")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("      Example:")
                                            .font(.headline)
                                        HStack{
                                            Text("      She ")
                                            Text("sleeps").foregroundColor(.red)
                                            Text(" in a bed.")
                                        }
                                        HStack{
                                            Text("      Aliquam ")
                                            Text("blandit").foregroundColor(.red)
                                            Text(" ante.")
                                        }
                                        .padding(.bottom, 5)
                                    }
                                    Group{
                                        Text("3. Drink")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("      Example:")
                                            .font(.headline)
                                        HStack{
                                            Text("      Lorem ")
                                            Text("ipsum").foregroundColor(.red)
                                            Text(" dolor sit amet.")
                                        }
                                        HStack{
                                            Text("      Aliquam ")
                                            Text("blandit").foregroundColor(.red)
                                            Text(" ante.")
                                        }
                                        .padding(.bottom, 5)
                                    }
                                }
                            }
                        
                    }
                }
            }
            
        }
        .padding(.horizontal, 10)
        .background(Color("Pale Blue"))
    }
    
    func calculateRectangleHeight(for text: String, width: CGFloat) -> CGFloat {
        let textHeight = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 20)]).height
        let padding: CGFloat = 30 // Adjust as needed
        return textHeight + (padding * 2)
    }
    
    func sentenceRectangle() {
        
    }
    
}

//extension VerticalAlignment {
//    private enum OverlayHeightAlignment: AlignmentID {
//        static func defaultValue(in context: ViewDimensions) -> CGFloat {
//            return context[.top]
//        }
//    }

//    static let overlayHeight = VerticalAlignment(OverlayHeightAlignment.self)
//}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
