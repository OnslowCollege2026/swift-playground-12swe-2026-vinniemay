// The Swift Programming Language
// https://docs.swift.org/swift-book

func temp() {
    print("☆⤷⋆｡°✩")
}


/// gets input from user of which tab they want to open to continue to that function
func homePage() {
    print("⋆｡°✩ Kumara Stall ✩°｡⋆")
    print("⤷ Enter number to open tab")
    print("1) Add stock")
    print("2) Sell stock")
    print("3) Current stock")
    print("4) Sale records")
    print("5) Bags Counter")
    print("6) Close program")

}

/// easy call back for any invalid input throughout the program
func generalInvalidInput() {
    print("Invalid option. Please re-enter with a valid number.")
}

/// keeps stock updated when new kumara is added
func addKumara(currentStock: Double, amount: Double) -> Double {
    return currentStock + amount
} 

/// keeps stock updated when kumara is sold
func sellKumara(currentStock: Double, amount: Double) -> Double  {
    return currentStock - amount
}

/// shows user stock
func printCurrentStock(currentStock: Double) {
    print("There is currently \(currentStock)kgs of kumara in stock.")
}

/// calculates and returns the price of a sale (not including bag price)
/// 1kg = $3
func calculateCostNoBag(sold: Double) -> Double {
    return sold * 3
}

/// checks how many bags were needed for a sale and returns price of the bags
/// 1 bag = 20c ($0.2)
func calculateBagCost(sold: Double) -> Double {
    var bags = 0.0
    var bagsCost = 0.0
    
    if sold <= 5 {
        bagsCost = 0.2
        return bagsCost
    } else {
    }
        bags = sold / 5 
        bagsCost = bags * 0.2
        return bagsCost
}

/// calculates how many bags were used in a sale and returns amount
func bagAmount(sold: Double) -> Double {
    var bags = 0.0
    bags = sold / 5
    return bags
}

/// record of most recent sale: amount & price
func printSale(sale: Double, price: Double) {
    print("You have sold \(sale)kgs of kumara for $\(price)")
}

@main
struct SwiftPlayground {
    static func main() {
        
        // setting up needed variables and consonants
        var bags = 5000.0
        let minimumKumara = 0.1
        let maxStock = 50.0

        var currentStock = 50.0 // kilos
        var money = 0.0

        var saleRecords = [
            [0.0],
            [0.0],
            [0.0]
        ]

        var binCapacityLeft = maxStock - currentStock

        var salePrice = 0.0

        // creates a while loop to keep the program running until user chooses to close it
        var runProgram = "true"
        while runProgram == "true" {

        // prints homepage and collects user input
        homePage()
        let userInput = readLine()
        let tabToOpen = userInput


        // opens tab to add kumara to stock and collect user input
        if tabToOpen == "1" {
            print("How much kumara would you like to add? (kgs)")
            var userInput = readLine()!
            var kumaraAdded = Double(userInput)!

                // checks for valid input, give positive feedback that the code worked and updates stock and bin capacity
                if kumaraAdded >= minimumKumara && kumaraAdded <= binCapacityLeft && kumaraAdded <= maxStock {
                    print("You have added \(kumaraAdded)kgs of kumara to the stock.")
                    binCapacityLeft = binCapacityLeft - kumaraAdded
                    currentStock = addKumara(currentStock: currentStock, amount: kumaraAdded)
                    printCurrentStock(currentStock: currentStock)

                // checks if amount added can fit into the bin, if not, asks for new input to make sure the bin does not overflow
                } else if kumaraAdded > binCapacityLeft {
                    print("There is not enough space in the bin. Please add a number lower than \(binCapacityLeft)kgs.")
                    userInput = readLine()!
                    kumaraAdded = Double(userInput)!
                    print("You have added \(kumaraAdded)kgs of kumara to the stock.")
                    binCapacityLeft = binCapacityLeft - kumaraAdded
                    currentStock = addKumara(currentStock: currentStock, amount: kumaraAdded)
                    printCurrentStock(currentStock: currentStock)

                // checks if user has added at least 1 kumara and not half a kumara or less (such as negative numbers) to avoid it breaking
                } else if kumaraAdded < minimumKumara {
                    print("You can not add less than 100gs of Kumara (1 Kumara). Please re-enter with a valid number.")
                    userInput = readLine()!
                    kumaraAdded = Double(userInput)!
                    print("You have added \(kumaraAdded)kgs of kumara to the stock.")
                    binCapacityLeft = binCapacityLeft - kumaraAdded
                    currentStock = addKumara(currentStock: currentStock, amount: kumaraAdded)
                    printCurrentStock(currentStock: currentStock)
                
                // any other invalid inputs asks user to reenter with a valid number
                } else {
                    generalInvalidInput()
                    userInput = readLine()!
                    kumaraAdded = Double(userInput)!
                    print("You have added \(kumaraAdded)kgs of kumara to the stock.")
                    binCapacityLeft = binCapacityLeft - kumaraAdded
                    currentStock = addKumara(currentStock: currentStock, amount: kumaraAdded)
                    printCurrentStock(currentStock: currentStock)
                }


        } else if tabToOpen == "2" {
            print("How much kumara would you like to sell? (kgs)")
            var userInput = readLine()!
            var kumaraSold = Double(userInput)!

                if kumaraSold > minimumKumara && kumaraSold <= currentStock {
                    binCapacityLeft = binCapacityLeft + kumaraSold
                    currentStock = sellKumara(currentStock: currentStock, amount: kumaraSold)
                    salePrice = calculateCostNoBag(sold: kumaraSold) + calculateBagCost(sold: kumaraSold)
                    money = money + salePrice
                    bags = bags - bagAmount(sold: kumaraSold)
                    printSale(sale: kumaraSold, price: salePrice)
                    printCurrentStock(currentStock: currentStock)
                    saleRecords.append([kumaraSold])
                    saleRecords.append([salePrice]) 
                    saleRecords.append([]) 
                
                } else if kumaraSold > currentStock {
                    print("You cannot sell more than what is in stock. Please enter with a lower number.")
                    userInput = readLine()!
                    kumaraSold = Double(userInput)!
                    binCapacityLeft = binCapacityLeft + kumaraSold
                    currentStock = sellKumara(currentStock: currentStock, amount: kumaraSold)
                    salePrice = calculateCostNoBag(sold: kumaraSold) + calculateBagCost(sold: kumaraSold)
                    money = money + salePrice
                    bags = bags - bagAmount(sold: kumaraSold)
                    printSale(sale: kumaraSold, price: salePrice)
                    printCurrentStock(currentStock: currentStock)
                    saleRecords.append([kumaraSold])
                    saleRecords.append([salePrice]) 
                    saleRecords.append([]) 
                
                } else if kumaraSold < minimumKumara {
                    print("You can not sell less than 100gs of Kumara (1 Kumara). Please re-enter with a valid number.")
                    userInput = readLine()!
                    kumaraSold = Double(userInput)!
                    binCapacityLeft = binCapacityLeft + kumaraSold
                    currentStock = sellKumara(currentStock: currentStock, amount: kumaraSold)
                    salePrice = calculateCostNoBag(sold: kumaraSold) + calculateBagCost(sold: kumaraSold)
                    money = money + salePrice
                    bags = bags - bagAmount(sold: kumaraSold)
                    printSale(sale: kumaraSold, price: salePrice)
                    printCurrentStock(currentStock: currentStock)
                    saleRecords.append([kumaraSold])
                    saleRecords.append([salePrice]) 
                    saleRecords.append([])
                
                } else {
                    generalInvalidInput()
                    userInput = readLine()!
                    kumaraSold = Double(userInput)!
                    binCapacityLeft = binCapacityLeft + kumaraSold
                    currentStock = sellKumara(currentStock: currentStock, amount: kumaraSold)
                    salePrice = calculateCostNoBag(sold: kumaraSold) + calculateBagCost(sold: kumaraSold)
                    money = money + salePrice
                    bags = bags - bagAmount(sold: kumaraSold)
                    printSale(sale: kumaraSold, price: salePrice)
                    printCurrentStock(currentStock: currentStock)
                    saleRecords.append([kumaraSold])
                    saleRecords.append([salePrice]) 
                    saleRecords.append([])
                }

                

        } else if tabToOpen == "3" {
            printCurrentStock(currentStock: currentStock)


        } else if tabToOpen == "4" {
            print("You have made $\(money) from the Kumara Stall")
            print("Sale Records:")
            print(saleRecords)


        } else if tabToOpen == "5" {
            print("You have \(bags) bags left.")

        } else if tabToOpen == "6"{
            print("⋆｡°✩ Thank you for using Kumara Stall. ✩°｡⋆")
            print("𝘊𝘭𝘰𝘴𝘪𝘯𝘨 𝘗𝘳𝘰𝘨𝘳𝘢𝘮...")
            runProgram = "false"
        

        } else {
            generalInvalidInput()
        }


        }
        
}}