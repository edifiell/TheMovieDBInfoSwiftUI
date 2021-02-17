import SwiftUI

struct LoginView: View {
    var body: some View {
        
        SignIn()
    }
}


struct SignIn : View {
    
    @State var destinationSecondVC = false
    @State var textToUpdate = "Login"
    @State var loading = false
    @State var token = ""
    @ObservedObject var getToken = GetToken()
    
    
    var body : some View{
        
        NavigationView {
            
            VStack {
                
                Text("Sign In").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 30)
                VStack{
                    
                    VStack(alignment: .leading){
                        
                        VStack(alignment: .leading){
                            Text("Username").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                            
                            HStack{
                                TextField("Enter Your Username -> demoProject", text: $getToken.firstName)
                                
                            }
                            
                            Divider()
                            
                        }.padding(.bottom, 15)
                        
                        VStack(alignment: .leading){
                            Text("Password").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                            
                            SecureField("Enter Your Password -> demoProject", text: $getToken.lastName)
                            
                            Divider()
                        }
                    }.padding(.horizontal, 6)
                }.padding()
                
                ActivityIndicatorView(animating: $loading, style: .medium)
                
                VStack{
                    
                    HStack {
                        
                        Button(action: {
                            self.loading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
                                self.loading = false
                            }
                            
                            self.textToUpdate = "Wait"
                            getToken.getData()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: { [self] in
                                getToken.postData()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(450)) {
                                    self.destinationSecondVC = getToken.enterLogin(token: getToken.token)
                                    
                                    if self.destinationSecondVC {
                                        self.textToUpdate = "Loading.."
                                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1700)) {
                                            self.textToUpdate = "Login"
                                        }
                                    } else {
                                        self.textToUpdate = "Denied"
                                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1450)) {
                                            self.textToUpdate = "Login"
                                        }
                                    }
                                }
                                
                            })
                        }) {
                            Text("\(textToUpdate)")
                                .frame(width: 40, height: 6, alignment: .center)
                                .font(.subheadline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Rectangle())
                                .cornerRadius(10.0)
                        }
                    }.padding(70)
                    HStack {
                        NavigationLink(
                            
                            destination: MainView(),
                            isActive: $destinationSecondVC,
                            label: {
                                Text("")
                                    .padding(50)
                                
                            })
                        
                    }
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        
    }
}
