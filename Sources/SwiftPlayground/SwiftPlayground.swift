// The Swift Programming Language
// https://docs.swift.org/swift-book

    /// function to print out starting menu
func menuChoice() {
    print("☆==== ⭒Egg Shop⭒ ====☆")
    print("1. Add eggs")
    print("2. Sell eggs")
    print("3. Show current stock")
    print("4. Show total eggs sold")
    print("5. Exit")
    print("Choose an option:")
    }

    /// function for printing error message 
func invalidInput() {
    print("Invalid option. Please re-enter with a valid number.")
    }

    /// calculates and updates egg stock after new eggs added
func addEggs(currentStock: Int, amount: Int) -> Int {
    return currentStock + amount
}

    /// calculates and updates egg stock after eggs sold
func sellEggs(currentStock: Int, amount: Int) -> Int {
    return currentStock - amount
}

    /// calculates and updates how many eggs have been sold
func updateSoldCount(currentSold: Int, amount: Int) -> Int {
    return currentSold + amount
}


@main
struct SwiftPlayground {
    static func main() {
        var menuNeeded = "true" 

            // starting variables to set the count of everything to 0
        var eggsInStock = 0
        var eggsSold = 0
        var totalEggsSold = 0
        var eggsAdded = 0

            // loop which will repeat until the user chooses to exit the program (option 5)
        while menuNeeded == "true" {
                // prints menu and stores the users choice 
            menuChoice()
            var userInput = readLine()!
            let userChoice = Int(userInput)

                    // if user chooses option 1, opens "Add eggs" section
                if userChoice == 1 {
                        // asks and stores input of eggs added
                    print("How many eggs would you like to add?")
                        userInput = readLine()!
                        eggsAdded = Int(userInput)!
                                // if the input is valid, runs function to update stock count (plus)
                            if eggsAdded >= 0 && eggsAdded <= 100 {
                            eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsAdded) 
                            

                                // if input is above the boundary, prints error and asks for user to reinput, then updates stock with new input
                            } else if eggsAdded > 100 {
                                
                                print("Too many eggs added at once. Please input a smaller number.")
                                userInput = readLine()!
                                eggsAdded = Int(userInput)!

                                eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsAdded) 
                                

                                // if input is below the boundary, prints error and asks for user to reinput, then updates stock with new input
                            } else if eggsAdded < 0 {
                                
                                print("You cannot add a negative amount of eggs, there is a 'Sell eggs' option for that. Please re-enter a valid number.")
                                userInput = readLine()!
                                eggsAdded = Int(userInput)!
                                eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsAdded) 
                                
                                
                                // if input is invalid, prints error and asks for user to reinput, then updates stock with new input
                            } else {
                                invalidInput()
                                userInput = readLine()!
                                eggsAdded = Int(userInput)!
                                eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsAdded) 
                                
                            }

                    // if user chooses option 2, opens "Sell eggs" section
                } else if userChoice == 2 {
                        // asks and stores input of eggs sold
                    print("How many eggs would you like to sell?")
                        userInput = readLine()!
                        eggsSold = Int(userInput)!
                                // if the input is valid, runs function to update stock count (minus)
                            if eggsSold >= 0 && eggsSold <= eggsInStock {
                            eggsInStock = sellEggs(currentStock: eggsInStock, amount: eggsSold)
                            totalEggsSold = updateSoldCount(currentSold: totalEggsSold, amount: eggsSold)

                                // if input is below the boundary, prints error and asks for user to reinput, then updates stock with new input
                            } else if eggsSold < 0 {
                                
                                print("You cannot sell a negative amount of eggs, there is an 'Add eggs' option for that. Please re-enter a valid number.")
                                userInput = readLine()!
                                eggsSold = Int(userInput)!
                                eggsInStock = sellEggs(currentStock: eggsInStock, amount: eggsSold)
                                totalEggsSold = updateSoldCount(currentSold: totalEggsSold, amount: eggsSold)

                                // if user tries to sell more eggs than there is in stock, prints error and asks for user to reinput, then updates stock with new input
                            } else if eggsSold > eggsInStock {
                                
                                print("You cannot sell \(userInput) eggs because there are only \(eggsInStock) eggs in stock. Please re-enter a valid number.")
                                userInput = readLine()!
                                eggsSold = Int(userInput)!
                                eggsInStock = sellEggs(currentStock: eggsInStock, amount: eggsSold)
                                totalEggsSold = updateSoldCount(currentSold: totalEggsSold, amount: eggsSold)

                                // if input is invalid, prints error and asks for user to reinput, then updates stock with new input
                            } else {
                                invalidInput()
                                userInput = readLine()!
                                eggsSold = Int(userInput)!
                                eggsInStock = sellEggs(currentStock: eggsInStock, amount: eggsSold)
                                totalEggsSold = updateSoldCount(currentSold: totalEggsSold, amount: eggsSold)
                            }

                    // if user chooses option 3, prints stock count
                } else if userChoice == 3 {
                        // checks if stock is below 0, if it is, resets to 0 (just in case of break in code)
                    if eggsInStock < 0 {
                        eggsInStock = 0
                    }
                    print("There are currently \(eggsInStock) eggs in stock.")

                    // if user chooses option 4, prints total of eggs sold
                } else if userChoice == 4 {
                    print("\(totalEggsSold) eggs have been sold.")
                    
                    // if user chooses option 5, ends program by ending while loop
                } else if userChoice == 5 {
                    print("☆⭒Thank you for using Egg Shop.⭒☆")
                    print("𝘊𝘭𝘰𝘴𝘪𝘯𝘨 𝘗𝘳𝘰𝘨𝘳𝘢𝘮...")
                    menuNeeded = "false"
                    
                    // if invalid input is entered into the menu, prints error message and restarts while loop until valid input is enter
                } else {
                    invalidInput() 
                    
                }
                
        }
    }
}