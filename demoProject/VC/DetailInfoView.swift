import SwiftUI

struct DetailInfo: View {
    var model: Poster.Object? = nil
    @ObservedObject var isLoading = ServerManager()
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                MainDetail(urlImage: model?.posterPath ?? "", isLoading: false)
                
                Text("Description")
                    .offset(x: -110.0, y: 0.0)
                    .foregroundColor(Color.black)
                    .font(.system(size: 20.0, weight: .heavy, design: .default))
                
                HStack {
                    Text("\(model?.overview ?? "")")
                        .multilineTextAlignment(.leading)
                        .padding(.all, 10)
                        .offset(x: 0, y: 0)
                }
            }.navigationTitle(Text("Detail menu"))
        }
    }
}


struct DetailInfo_Previews: PreviewProvider {
    static var previews: some View {
        DetailInfo()
    }
}

