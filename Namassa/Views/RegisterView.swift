import SwiftUI


struct RegisterView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
//    @State private var isInvalidUser = false
//    @State private var isInvalidEmail = false
//    @State private var isInvalidPass = false
    
    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray.opacity(0.3))
                    .padding(.bottom, 40)
                
                
                Text("Crie sua conta")
                    .font(.system(size: 26))
                    .padding(.bottom, 30)
                
                VStack(spacing:20){//qd colocar sombra, poe 33 em spacing
                    
                    FieldView(symbol:"person" ,message: "Insira seu nome de usuário", txt: $username, isSecure: false)
                    
                    FieldView(symbol: "mail" ,message: "Insira seu E-mail", txt: $email, isSecure: false)
                    
                    FieldView(symbol: "key" ,message: "Insira sua senha", txt: $password, isSecure: true)
                    
                    
                    Button {
                        //isInvalidUser = username.isEmpty ? true:false
                        
                    }label: {
                        Text("CRIAR")
                            .font(.system(size:20))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .padding(.leading, 50)
                            .padding(.trailing, 50)
                    }
                    .background(Color(hex: "#FF2201"))
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(radius: 2)
                    
                }//fim VStack
                
                Spacer()
                Button {
                    //RegisterView
                }label: {
                    Text("Já possui uma conta?")
                        .foregroundColor(.black.opacity(0.4))
                        .underline()
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    RegisterView()
}



