// ContentView.swift
// Ejemplo educativo de SwiftUI para Tecmilenio
// Este archivo muestra cómo capturar datos básicos usando SwiftUI y el patrón de estado (@State).
// Ideal para estudiantes que inician en desarrollo iOS.
// Puedes expandir este ejemplo agregando validaciones, modularizando vistas, o usando otros tipos de datos.

import SwiftUI

// 1️⃣ Estructura de datos
// Usamos una estructura simple para agrupar los datos personales ingresados por el usuario.
// En proyectos más grandes, podrías usar clases, structs más complejas o modelos con validación.
struct InformacionPersonal {
    var nombre: String      // Nombre del usuario
    var edad: String        // Edad del usuario (como String para simplificar el ejemplo)
    var colorFavorito: String // Color favorito del usuario
}

// 2️⃣ Vista principal
// Esta vista contiene los campos de entrada y muestra la información capturada.
struct ContentView: View {
    // MARK: - Variables de estado
    // Usamos @State para que la vista se actualice automáticamente cuando cambian estos valores.
    @State private var nombre = ""           // Almacena el nombre ingresado
    @State private var edad = ""             // Almacena la edad ingresada
    @State private var colorFavorito = ""    // Almacena el color favorito ingresado
    
    @State private var mostrarInformacion = false // Controla si se muestra la información capturada
    
    var body: some View {
        VStack(spacing: 20) {
            // Título principal
            Text("Ingresa tu información")
                .font(.title)
            
            // Campos de entrada
            // Puedes agregar validación para evitar campos vacíos o datos incorrectos.
            TextField("Nombre", text: $nombre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Edad", text: $edad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .keyboardType(.numberPad) // Muestra teclado numérico
            
            TextField("Color favorito", text: $colorFavorito)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Botón para mostrar la información
            Button("Mostrar información") {
                // Al presionar, se muestra la información debajo
                mostrarInformacion = true
                
                // Creamos una instancia de la estructura con los datos ingresados
                let misDatos = InformacionPersonal(
                    nombre: nombre,
                    edad: edad,
                    colorFavorito: colorFavorito
                )
                
                // Imprime en consola para depuración
                print("👤 Nombre: \(misDatos.nombre)")
                print("🎂 Edad: \(misDatos.edad)")
                print("🎨 Color favorito: \(misDatos.colorFavorito)")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            // Muestra en pantalla la información ingresada
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
            
            Spacer() // Empuja el contenido hacia arriba
        }
        .padding() // Agrega espacio alrededor del VStack
    }
}

// 3️⃣ Vista previa para Live Preview
// Permite ver la interfaz en tiempo real en Xcode Canvas.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
