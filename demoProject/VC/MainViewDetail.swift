import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct MainDetail: View {
    var urlImage : String
    var model: Poster.Object? = nil
    var addAdress = "https://image.tmdb.org/t/p/original"
    var isLoading: Bool
    
    var body: some View {
        
        ZStack {
            
            Group {
                if isLoading {
                    WebImage(url: URL(string: addAdress+urlImage)).resizable().frame(width: (UIScreen.main.bounds.width - 1) / 3.3, height: (UIScreen.main.bounds.height - 1) / 3.3).clipShape(Circle()).shadow(radius: 20 )
                    
                } else {
                    WebImage(url: URL(string: addAdress+urlImage)).resizable().frame(width: (UIScreen.main.bounds.width ) / 1, height: (UIScreen.main.bounds.height ) / 1.7).clipShape(Rectangle()).shadow(radius: 20 )
                }
            }
            
            ZStack {
                
                Text(model?.originalTitle ?? "")
                    .font(Font.system(.headline).bold())
                    .lineLimit(2)
                    .offset(y: 82)
                    .padding(.trailing, 80)
                    .truncationMode(.middle)
                    .foregroundColor(Color.black)
            }
        }
    }
}
