import Foundation


extension GetToken {
    func enterLogin (token: String) -> Bool{
        var result = false
        if self.success  {
            
            result = true
            
        } else  {
            print("Login or password don't right")
        }
        return result
    }
}
