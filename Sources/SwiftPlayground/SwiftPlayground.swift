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

func addEggs(currentStock: Int, amount: Int) -> Int {
    return currentStock + amount
}

func sellEggs(currentStock: Int, amount: Int) -> Int {
    return currentStock - amount
}



@main
struct SwiftPlayground {
    static func main() {
        var menuNeeded = "true" 

        var eggsInStock = 0
        var eggsSold = 0
        var totalEggsSold = 0
        var eggsAdded = 0
        var totalEggsAdded = 0


        while menuNeeded == "true" {
            menuChoice()
            var userInput = readLine()!
            var userChoice = Int(userInput)
            // calls function to print menu and asks user to select an option. stores input in variable
                if userChoice == 1 {
                    
                
                    print("How many eggs would you like to add?")
                        userInput = readLine()!
                        eggsAdded = Int(userInput)!
                            if eggsAdded >= 0, eggsAdded <= 100 {
                            eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsAdded) 
                            totalEggsAdded = totalEggsAdded + eggsAdded
                            
                        } else if eggsAdded > 100 && eggsAdded < 0 {
                            print("Too many eggs added at once. Please input a smaller number.")
                            userInput = readLine()!
                            eggsAdded = Int(userInput)!
                        } else if eggsAdded < 0 {
                            print("You cannot add a negative amount of eggs, theres a Sell eggs option for that. Please re-enter a valid number.")
                            userInput = readLine()!
                            eggsAdded = Int(userInput)!
                        } else {
                            invalidInput()
                            userInput = readLine()!
                            eggsAdded = Int(userInput)!}

                        
                    } else if userChoice == 2 {
                    print("How many eggs would you like to sell?")
                        userInput = readLine()!
                        eggsSold = Int(userInput)!
                            eggsInStock = sellEggs(currentStock: eggsInStock, amount: eggsSold)
                            totalEggsSold = totalEggsSold + eggsSold
                    // if user chooses to sell eggs, it will ask them to input an amount and will remove this from the amount of eggs in stock

                } else if userChoice == 3 {
                    print("There are currently \(eggsInStock) eggs in stock.")
                    // if user chooses to show current stock, it will print it out

                } else if userChoice == 4 {
                    print("\(totalEggsSold) eggs have been sold.")
                    // if user chooses to see how many eggs have been sold, it will print out the total

                } else if userChoice == 5 {
                    print("☆⭒Thank you for using Egg Shop.⭒☆")
                    print("𝘊𝘭𝘰𝘴𝘪𝘯𝘨 𝘗𝘳𝘰𝘨𝘳𝘢𝘮...")
                    menuNeeded = "false"
                    // if user chooses to exit the program, the while loop will end and the program will finish

                } else {
                    invalidInput() 
                    // if user inputs an invalid option,it will ask them to reinput and will go back to the start of the while loop to show the menu again
                }
            
        }
}}