// The Swift Programming Language
// https://docs.swift.org/swift-book

func temp() {
    print("☆⤷⋆｡°✩")
}

func homePage() -> Int {
    print("⋆｡°✩ Kumara Stall ✩°｡⋆")
    print("⤷ Enter number to open tab")
    print("1) Add stock")
    print("2) Current stock")
    print("3) Sale records")

    var userInput = readLine() 
    if userInput >= 1 && userInput <= 3 {
        
    } else if userInput < 1 && userInput > 3 { 
        print("Invalid input. Please re-enter with a valid number.")
        userInput = readLine()
        
    } else {
        print("Invalid input. Please re-enter with a valid number.")
        userInput = readLine()
        
    }
    let tabOpen = userInput
    return tabOpen
}

@main
struct SwiftPlayground {
    static func main() {
        let bags = 5000 
        let kumaraKiloCost = 3
        let minimumKumara = 0.1
        
}}