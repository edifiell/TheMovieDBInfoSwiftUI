import SwiftUI


class ServerManager: ObservableObject {
    
    @Published var dataList = [Poster.Object]()
    @Published var image: UIImage?
    
    init() {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=2564a03cba83451aec2fdd279de99bf7&language=en-US&page=1") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard let _ = response, let data = data else { return }
            
            do {
                let myServiceResponse = try JSONDecoder().decode(Poster.self, from: data)
                DispatchQueue.main.async {
                    self.dataList = myServiceResponse.results
                }
                
            } catch {
                print("erroR")
            }
        }.resume()
    }
    
}


