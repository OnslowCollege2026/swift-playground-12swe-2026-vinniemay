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

func updateSoldCount(currentSold: Int, amount: Int) -> Int {
    return currentSold + amount
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
            let userChoice = Int(userInput)


                if userChoice == 1 {

                    print("How many eggs would you like to add?")
                        userInput = readLine()!
                        eggsAdded = Int(userInput)!

                            if eggsAdded >= 0 && eggsAdded <= 100 {
                            eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsAdded) 
                            totalEggsAdded = totalEggsAdded + eggsAdded
                            
                            } else if eggsAdded > 100 {
                                
                                print("Too many eggs added at once. Please input a smaller number.")
                                userInput = readLine()!
                                eggsAdded = Int(userInput)!

                                eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsAdded) 
                                

                            } else if eggsAdded < 0 {
                                
                                print("You cannot add a negative amount of eggs, there is a 'Sell eggs' option for that. Please re-enter a valid number.")
                                userInput = readLine()!
                                eggsAdded = Int(userInput)!
                                eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsAdded) 
                                
                                

                            } else {
                                invalidInput()
                                userInput = readLine()!
                                eggsAdded = Int(userInput)!
                                eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsAdded) 
                                
                            }

                        
                } else if userChoice == 2 {
                    print("How many eggs would you like to sell?")
                        userInput = readLine()!
                        eggsSold = Int(userInput)!

                            if eggsSold >= 0 && eggsSold <= eggsInStock {
                            eggsInStock = sellEggs(currentStock: eggsInStock, amount: eggsSold)
                            totalEggsSold = updateSoldCount(currentSold: totalEggsSold, amount: eggsSold)

                            } else if eggsSold < 0 {
                                
                                print("You cannot sell a negative amount of eggs, there is an 'Add eggs' option for that. Please re-enter a valid number.")
                                userInput = readLine()!
                                eggsSold = Int(userInput)!
                                eggsInStock = sellEggs(currentStock: eggsInStock, amount: eggsSold)
                                totalEggsSold = updateSoldCount(currentSold: totalEggsSold, amount: eggsSold)

                            } else if eggsSold > eggsInStock {
                                
                                print("You cannot sell \(userInput) eggs because there are only \(eggsInStock) eggs in stock. Please re-enter a valid number.")
                                userInput = readLine()!
                                eggsSold = Int(userInput)!
                                eggsInStock = sellEggs(currentStock: eggsInStock, amount: eggsSold)
                                totalEggsSold = updateSoldCount(currentSold: totalEggsSold, amount: eggsSold)

                            } else {
                                invalidInput()
                                userInput = readLine()!
                                eggsSold = Int(userInput)!
                                eggsInStock = sellEggs(currentStock: eggsInStock, amount: eggsSold)
                                totalEggsSold = updateSoldCount(currentSold: totalEggsSold, amount: eggsSold)
                            }

                    

                } else if userChoice == 3 {
                    if eggsInStock < 0 {
                        eggsInStock = 0
                    }
                    print("There are currently \(eggsInStock) eggs in stock.")


                } else if userChoice == 4 {
                    print("\(totalEggsSold) eggs have been sold.")
                    

                } else if userChoice == 5 {
                    print("☆⭒Thank you for using Egg Shop.⭒☆")
                    print("𝘊𝘭𝘰𝘴𝘪𝘯𝘨 𝘗𝘳𝘰𝘨𝘳𝘢𝘮...")
                    menuNeeded = "false"
                    

                } else {
                    invalidInput() 
                    
                }
            
        }
    }
}