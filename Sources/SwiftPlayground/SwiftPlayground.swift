// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation 

@main
struct SwiftPlayground {
    static func main() {
        // Constants and variables

        ///Each inner array contains the English word, the correct answer in the target language,
        /// and then three incorrect answers
        var vocabulary = [
            ["Hello",       "Hola",        "Adios",    "Hasta luego",   "Chao"],
            ["Goodbye",     "Adios",       "Este",     "Como estas",    "Buenas noches"],
            ["Thank you",   "Gracias",     "Muy bien", "Y tu",          "Estoy cansado"],
            ["Goodmorning", "Buenas dias", "Azucar",   "Buenas tardes", "Hasta la vista"],
            ["How are you", "Como estas",   "Que tal", "Aqui",          "Por que"]
        ]

        /// The indices of the questions that the user got wrong
        var incorrectIndices: [Int] = []

        /// The number of questions that the user got wrong the first time around
        var incorrectCount = 0

        /// The number of questions that have been asked
        var count = 0

        vocabulary.shuffle()
        

        // loop until all of the vocabulary questions have been asked
        while count < vocabulary.count {
            // Show the question
            print("Translate ____ to Spanish:")
            

            // Present the possible answers

            // Check if user guessed the correct answer
            // If not, make a note of the question to ask again later
            
        } 

        

        
    }
}