//
//  ContentView.swift
//  ReversorApp
//
//  Created by Jerry Anderson Huaynacho Mango on 14/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    @State private var arrayOriginal: [Int] = []
    @State private var arrayInvertido: [Int] = []
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Reversor de Arreglos")
                .font(.title)
                .bold()
            
            TextField("Ingresa los numeros separados por comas ", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Invertir Arreglo") {
                procesarArreglo()
            }
            
            if !arrayOriginal.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Arreglo Original:")
                    Text(arrayOriginal.map(String.init).joined(separator: ", "))
                    
                    Text("Arreglo Invertido:")
                    Text(arrayInvertido.map(String.init).joined(separator: ", "))
                }
            }
        }
        .padding()
    }
    func procesarArreglo() {
        let elementos = inputText
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        
        arrayOriginal = elementos.compactMap { Int($0) }
        arrayInvertido = arrayOriginal.reversed()
    }
}

#Preview {
    ContentView()
}
