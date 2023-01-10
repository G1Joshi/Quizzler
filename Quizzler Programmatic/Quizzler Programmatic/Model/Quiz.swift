//
//  Quiz.swift
//  Quizzler Programmatic
//
//  Created by Jeevan Chandra Joshi on 10/01/23.
//

import Foundation

struct Quiz {
    let question: String
    let answer: String

    static var questionNumber = 0

    static let quiz = [
        Quiz(question: "A slug's blood is green.", answer: "True"),
        Quiz(question: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Quiz(question: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Quiz(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Quiz(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Quiz(question: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Quiz(question: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Quiz(question: "Google was originally called 'Backrub'.", answer: "True"),
        Quiz(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Quiz(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Quiz(question: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Quiz(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True"),
    ]

    static func getQuestion() -> String {
        return quiz[questionNumber].question
    }

    static func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }

    static func checkAnswer(_ selectedAnswer: String?) -> Bool {
        if selectedAnswer == quiz[questionNumber].answer {
            return true
        } else {
            return false
        }
    }

    static func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
}
