import SwiftUI

// 1️⃣ Estructura de datos
struct InformacionPersonal {
    var nombre: String
    var edad: String
    var colorFavorito: String
}

// 2️⃣ Vista principal
struct ContentView: View {
    
    @State private var nombre = ""
    @State private var edad = ""
    @State private var colorFavorito = ""
    
    @State private var mostrarInformacion = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Ingresa tu información")
                .font(.title)
            
            // Campos de entrada
            TextField("Nombre", text: $nombre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Edad", text: $edad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            TextField("Color favorito", text: $colorFavorito)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Botón para mostrar la información
            Button("Mostrar información") {
                mostrarInformacion = true
                
                // Crear instancia de la estructura
                let misDatos = InformacionPersonal(
                    nombre: nombre,
                    edad: edad,
                    colorFavorito: colorFavorito
                )
                
                // Imprimir en consola
                print("👤 Nombre: \(misDatos.nombre)")
                print("🎂 Edad: \(misDatos.edad)")
                print("🎨 Color favorito: \(misDatos.colorFavorito)")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            // Mostrar en pantalla
            if mostrarInformacion {
                VStack(spacing: 5) {
                    Text("👤 Nombre: \(nombre)")
                    Text("🎂 Edad: \(edad)")
                    Text("🎨 Color favorito: \(colorFavorito)")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}

// 3️⃣ Vista previa para Live Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
