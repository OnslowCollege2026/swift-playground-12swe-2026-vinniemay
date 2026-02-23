// The Swift Programming Language
// https://docs.swift.org/swift-book


func menuChoice() {
    print("☆==== ⭒Egg Shop⭒ ====☆")
    print("1. Add eggs")
    print("2. Sell eggs")
    print("3. Show current stock")
    print("4. Show total eggs sold")
    print("5. Exit")
    print("Choose an option:")
    }

func invalidInput() {
    print("Invalid option. Please re-enter with a valid number.")
    }



@main
struct SwiftPlayground {
    static func main() {
        var menuNeeded = "true" 

        var eggsInStock = 0
        var eggsSold = 0

        while menuNeeded == "true" {
            menuChoice()
            var userInput = readLine()!
            var userChoice = Int(userInput)!
                if userChoice == 1 {
                    print("test1")
                } else if userChoice == 2 {
                    print("test2")
                } else if userChoice == 3 {
                    print("test3")
                } else if userChoice == 4 {
                    print("test4")
                } else if userChoice == 5 {
                    print("☆⭒Thank you for using Egg Shop.⭒☆")
                    print("𝘊𝘭𝘰𝘴𝘪𝘯𝘨 𝘗𝘳𝘰𝘨𝘳𝘢𝘮...")
                    menuNeeded = "false"
                } else {
                    invalidInput() 
                    userInput = readLine()!
                    userChoice = Int(userInput)!
                }
            
        }
}}