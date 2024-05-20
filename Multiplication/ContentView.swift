//
//  ContentView.swift
//  Multiplication
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedNumber = 2
    @State private var questionCount = 5
    @State private var questions = [Question]()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.yellow
                    .ignoresSafeArea()
                VStack {
                    Text("Choose a number")
                        .font(.title)
                        .padding()
                    
                    Stepper(value: $selectedNumber, in: 2...10, label: {
                        Text("\(selectedNumber) * X")
                            .padding()
                    })
                    .padding()
                    
                    
                    Text("How many questions")
                        .font(.title)
                        .padding()
                    Picker("Number of Questions", selection: $questionCount) {
                        Text("5").tag(5)
                        Text("10").tag(10)
                        Text("20").tag(20)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    NavigationLink(destination: GameView(questions: questions)) {
                        Text("Start Game")
                    }
                    .foregroundStyle(.white)
                    .frame(width: 100, height: 30)
                    .background(
                        Color.black
                            .cornerRadius(10)
                    )
                    .padding()
                    .disabled(questions.isEmpty)
                }
                .navigationTitle("Multiplication Practice")
                .padding()
            }
            .onAppear {
                questions = generateQuestions(upTo: selectedNumber, questionCount: questionCount)
            }
            .onChange(of: selectedNumber) { _ in
                questions = generateQuestions(upTo: selectedNumber, questionCount: questionCount)
            }
            .onChange(of: questionCount) { _ in
                questions = generateQuestions(upTo: selectedNumber, questionCount: questionCount)
            }
        }
    }
    
    
    func generateQuestions(upTo selectedNumber: Int, questionCount: Int) -> [Question] {
        var generatedQuestions = [Question]()
        
        for _ in 0..<questionCount {
            let firstNumber = selectedNumber
            let secondNumber = Int.random(in: 2...10)
            let text = "\(firstNumber) x \(secondNumber)"
            let answer = firstNumber * secondNumber
            let question = Question(text: text, answer: answer)
            generatedQuestions.append(question)
        }
        
        return generatedQuestions
    }
}

#Preview {
    ContentView()
}
