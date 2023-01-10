//
//  Quiz.swift
//  Quizzler Storyboard
//
//  Created by Jeevan Chandra Joshi on 10/01/23.
//

import Foundation

struct Quiz {
    let question: String
    let options: [String]
    let answer: String

    static var questionNumber = 0, score = 0

    static let quiz = [
        Quiz(question: "Which is the largest organ in the human body?", options: ["Heart", "Skin", "Large Intestine"], answer: "Skin"),
        Quiz(question: "Five dollars is worth how many nickels?", options: ["25", "50", "100"], answer: "100"),
        Quiz(question: "What do the letters in the GMT time zone stand for?", options: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], answer: "Greenwich Mean Time"),
        Quiz(question: "What is the French word for 'hat'?", options: ["Chapeau", "Écharpe", "Bonnet"], answer: "Chapeau"),
        Quiz(question: "In past times, what would a gentleman keep in his fob pocket?", options: ["Notebook", "Handkerchief", "Watch"], answer: "Watch"),
        Quiz(question: "How would one say goodbye in Spanish?", options: ["Au Revoir", "Adiós", "Salir"], answer: "Adiós"),
        Quiz(question: "Which of these colours is NOT featured in the logo for Google?", options: ["Green", "Orange", "Blue"], answer: "Orange"),
        Quiz(question: "What alcoholic drink is made from molasses?", options: ["Rum", "Whisky", "Gin"], answer: "Rum"),
        Quiz(question: "What type of animal was Harambe?", options: ["Panda", "Gorilla", "Crocodile"], answer: "Gorilla"),
        Quiz(question: "Where is Tasmania located?", options: ["Indonesia", "Australia", "Scotland"], answer: "Australia"),
    ]

    static func getQuestion() -> String {
        return quiz[questionNumber].question
    }

    static func getOptions() -> [String] {
        return quiz[questionNumber].options
    }

    static func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }

    static func getScore() -> Int {
        return score
    }

    static func checkAnswer(_ selectedAnswer: String?) -> Bool {
        if selectedAnswer == quiz[questionNumber].answer {
            score += 1
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
            score = 0
        }
    }
}
