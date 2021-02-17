import Foundation
import SwiftUI


class GetToken: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    
    var data = Token(success: false, expiresAt: "", requestToken: "")
    var token = ""
    var success = false
    
    
    func getData() {
        let urlString = "https://api.themoviedb.org/3/authentication/token/new?api_key=2564a03cba83451aec2fdd279de99bf7"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decoderData = try decoder.decode(Token.self, from: data)
                        
                        let token = decoderData.requestToken
                        self.token = token
                        
                    } catch {
                        print("Error! Something went wrong")
                    }
                }
            }
        }.resume()
    }
    
    func postData() {
        
        let urlString = "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=2564a03cba83451aec2fdd279de99bf7"
        let url = URL(string: urlString)
        let parameters: Any = ["username": self.firstName, "password": self.lastName, "request_token": self.token]
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        DispatchQueue.main.async {
            session.dataTask(with: request) { (data, response, error) in
                
                guard let data = data else { return }
                do {
                    
                    let decoder = JSONDecoder()
                    let decoderData = try decoder.decode(Token.self, from: data)
                    
                    let kuk = decoderData.success
                    self.success = kuk
                    print(kuk)
                    
                    
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
    
    
}







