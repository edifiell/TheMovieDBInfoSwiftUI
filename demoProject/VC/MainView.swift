import SwiftUI
import SDWebImageSwiftUI

struct MainView: View {
    @ObservedObject var serverManager = ServerManager()
    
    let layout = [
        GridItem(.adaptive(minimum: 150, maximum: 175))]
    
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: layout, spacing: 12) {
                
                ForEach(serverManager.dataList, id: \.self) { model in
                    
                    ZStack {
                        
                        NavigationLink(destination: DetailInfo(model: model)) {
                            MainDetail(urlImage: model.posterPath ?? "", model: model, isLoading: true)
                            
                        }.navigationTitle(Text("Main menu"))
                    }
                    
                }
            }
        }
    }
}













struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


