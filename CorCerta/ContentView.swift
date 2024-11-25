//
//  ContentView.swift
//  CorCerta
//
//  Created by Sandro Lopes on 23/02/24.
//

 
import SwiftUI

struct ContentView: View {
    
    @State private var desafio: [Int] = []
    @State private var resposta: [Int] = []
    @State private var acertos: [Int] = []
    @State private var montante: [[Int]] = [[]]
    @State private var limite = 0
    @State private var jogadas = 0
    @State private var isJogar = false
    var pontos: Int {
            // Verifica se os arrays têm o mesmo tamanho
            guard desafio.count == resposta.count else {
                fatalError("Os arrays têm tamanhos diferentes.")
            }

            // Contador para elementos iguais nas mesmas posições
            var count = 0

            // Percorre os arrays e compara os elementos nas mesmas posições
            for i in 0..<desafio.count {
                if desafio[i] == resposta[i] {
                    count += 1
                }
            }

            return count
        }
    
    var body: some View {
        VStack {
            
            HStack{
                     ForEach(acertos.indices, id: \.self) { index in
                        Text("\(acertos[index])")
                            .padding(4)
                            .font(.title)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    }
            }
            Spacer()
            
            VStack(spacing: 5) {
                ForEach(montante, id: \.self) { row in
                    HStack(spacing: 5) {
                        ForEach(row, id: \.self) { col in
                            Circle()
                                .foregroundColor(circleColor(for: col))
                                .frame(width: 40, height: 40)
                        }
                    }
                }
            }
            .padding()
        
    
            
            HStack{
                // Exibindo os elementos do array 2D
                
                
               ForEach(0..<montante.count, id: \.self) { row in
                              
                                   
                               }
                           
                Spacer()
                HStack{
                    ForEach(resposta.indices, id: \.self) { index in
                        
                        
                        switch resposta[index] {
                        case 1:
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: 40, height: 40)
                        case 2:
                            Circle()
                                .foregroundColor(.yellow)
                                .frame(width: 40, height: 40)
                        case 3:
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: 40, height: 40)
                        case 4:
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 40, height: 40)
                        case 5:
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: 40, height: 40)
                        default:
                            Color.black
                        }
                        
                    }
                }
            }
           
            Spacer()
            HStack{
                if isJogar == true {
                    Button(action: {
                        if limite <= 4 {
                            resposta.append(1)
                            limite += 1
                        }
                    }) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {
                        if limite <= 4 {
                            resposta.append(2)
                            limite += 1
                        }
                        
                    }) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.yellow)
                    }
                    
                    Button(action: {
                        if limite <= 4 {
                            resposta.append(3)
                            limite += 1
                        }
                        
                    }) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.red)
                    }
                    
                    Button(action: {
                        if limite <= 4 {
                            resposta.append(4)
                            limite += 1
                        }
                        
                    }) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.green)
                    }
                    
                    Button (action: {
                        if limite <= 4 {
                            resposta.append(5)
                            limite += 1
                        }
                        
                    }){
                        Image (systemName: "star.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                    }
                }
            }
            Spacer()
            VStack{
                
                if isJogar == false {
                    Text("Acerte a ordem das cores!")
                        .foregroundColor(.red)
                        .font(.title)
                    Spacer()

                    Button(action: {
                        // Gere 5 números aleatórios no intervalo de 1 a 5
                        self.desafio = (1...5).map { _ in
                            Int.random(in: 1...5)
                           
                        }
                        isJogar = true
                    }) {
                        Text("JOGAR")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    
                   
                    }
                    
                } else {
                    Spacer()
                    if limite > 4 {
                        // Botão para adicionar array2 dentro de array1
                        Button(action: {
                            self.addArrayToArray()
                        }) {
                            Text("Comparar")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding()
                        }
                        
                        
                    }
                    
                }

            }
            
        }.background(
            Image("Imcor2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                //.rotationEffect(Angle(degrees: 180))
                
                .edgesIgnoringSafeArea(.all)
        )
       
    }
    
    
    

func circleColor(for number: Int) -> Color {
       switch number {
       case 1: return .blue
       case 2: return .yellow
       case 3: return .red
       case 4: return .green
       case 5: return .black
       default: return .black
       }
   }
  
    // Função para contar elementos iguais nos arrays
        func countEqualElements() -> Int {
            let equalElements = Set(desafio).intersection(resposta)
           
            return equalElements.count
        }
    
   
    
    // Função para adicionar um array dentro de outro array
        func addArrayToArray() {
           // montante.append(contentsOf: resposta)
           // montante += resposta
            acertos.append(pontos)
            montante.append(resposta)
            resposta.removeAll()
            limite = 0
            jogadas += 1
            if jogadas >= 12 {
                self.desafio = (1...5).map { _ in
                    Int.random(in: 1...5)
                   
                }
                jogadas = 0
                acertos.removeAll()
                montante.removeAll()
                isJogar = false
            }
        }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
