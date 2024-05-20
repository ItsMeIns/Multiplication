//
//  GameView.swift
//  Multiplication
//
//  Created by macbook on 17.12.2023.
//

import SwiftUI

struct GameView: View {
    let questions: [Question]
    
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var correctAnswers = 0
    
    var body: some View {
        ZStack {
            
            Color.yellow
                .ignoresSafeArea()
            VStack {
                if currentQuestionIndex < questions.count {
                    Text("Question \(currentQuestionIndex + 1) / \(questions.count)")
                        .font(.headline)
                        .padding()
                    
                    Text("\(questions[currentQuestionIndex].text)")
                        .font(.largeTitle)
                        .padding()
                    
                    TextField("Your Answer", text: $userAnswer)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(40)
                    
                    Button("Submit Answer") {
                        checkAnswer()
                    }
                    .foregroundStyle(.white)
                    .frame(width: 150, height: 30)
                    .background(
                        Color.black
                            .cornerRadius(10)
                    )
                    .padding()
                } else {
                    Text("Game Over!")
                        .font(.title)
                        .padding()
                    
                    Text("You got \(correctAnswers) out of \(questions.count) correct!")
                        .padding()
                    
                    Button("Play Again") {
                        currentQuestionIndex = 0
                        userAnswer = ""
                        correctAnswers = 0
                    }
                    .foregroundStyle(.white)
                    .frame(width: 150, height: 30)
                    .background(
                        Color.black
                            .cornerRadius(10)
                    )
                    .padding()
                }
            }
            .navigationTitle("Game")
        }
    }
    
    func checkAnswer() {
        guard let userAnswerInt = Int(userAnswer) else { return }
        
        if userAnswerInt == questions[currentQuestionIndex].answer {
            correctAnswers += 1
        }
        
        currentQuestionIndex += 1
        userAnswer = ""
    }
}

