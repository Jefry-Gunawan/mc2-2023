import SwiftUI

struct CardView: View {
    
    var title: String
    
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .frame(width: .infinity, height: 65)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.1), radius: 3, y: 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "hello")
    }
}
