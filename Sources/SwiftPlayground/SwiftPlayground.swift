// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation 

@main
struct SwiftPlayground {
    static func main() {
        // Constants and variables

        ///Each inner array contains the English word, the correct answer in the target language,
        /// and then three incorrect answers
        let vocabulary: [[String]] = [
            ["Hello",       "Hola",        "Adios",    "Hasta luego",   "Chao"],
            ["Goodbye",     "Adios",       "Este",     "Como estas",    "Buenas noches"],
            ["Thank you",   "Gracias",     "Muy bien", "Y tu",          "Estoy cansado"],
            ["Goodmorning", "Buenas dias", "Azucar",   "Buenas tardes", "Hasta la vista"],
            ["How are you", "Como estas",   "Que tal", "Aqui",          "Por que"]
        ]

        var counter = 0
        var score = 0
        var incorrectAnswerIndices: [Int] = []

        while counter < vocabulary.count {
            let englishWord = vocabulary[counter][0]
            let correctWord = vocabulary[counter][1]
            let allAnswers = vocabulary[counter].dropFirst().shuffled()


            print("Please translate '\(englishWord)'")
            allAnswers.forEach { answer in
            print("⟡ \(answer)")
            }

            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                score = score + 1
                print("'\(correctWord)' is correct!")
            } else {
                incorrectAnswerIndices.append(counter)
                print("Incorrect! The correct answer is '\(correctWord)'")
            }

            counter = counter + 1
        }

        while incorrectAnswerIndices.count > 0 {
            let index = incorrectAnswerIndices[0]

            let englishWord = vocabulary[index][0]
            let correctWord = vocabulary[index][1]
            let allAnswers = vocabulary[index].dropFirst().shuffled()

            print("Please translate '\(englishWord)'")
            allAnswers.forEach { answer in
            print("⟡ \(answer)")
            }

            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                incorrectAnswerIndices.removeFirst()
                print("'\(correctWord)' is correct!")
            } else {
                print("Incorrect! The correct answer is '\(correctWord)'")
            }
        }

        print("You have a score of \(score)/\(vocabulary.count)")
        if Double(score) >= Double(vocabulary.count / 2) {
            print("Congratulations!") 
        } else {
            print("Try again next time!")
        }

    }

} 
    
