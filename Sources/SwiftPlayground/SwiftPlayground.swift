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
    print("5) Close program")

}

func generalInvalidInput() {
    print("Invalid option. Please re-enter with a valid number.")
}

func addKumara(currentStock: Double, amount: Double) -> Double {
    return currentStock + amount
} 

func sellKumara(currentStock: Double, amount: Double) -> Double  {
    return currentStock - amount
}
    
func printCurrentStock(currentStock: Double) {
    print("There is currently \(currentStock)kgs of kumara in stock.")
}

func calculateCostNoBag(sold: Double) -> Double {
    return sold * 3
}

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

func printSale(sale: Double, price: Double) {
    print("You have sold \(sale)kgs of kumara for $\(price)")
}

@main
struct SwiftPlayground {
    static func main() {
        let bags = 5000 
        let minimumKumara = 0.1
        let maxStock = 50.0

        var kumaraSold = 10.0 // kilos
        var kumaraAdded = 0.0 // kilos
        var currentStock = 50.0 // kilos
        var money = 0.0


        var binCapacityLeft = maxStock - currentStock

        var salePrice = 0.0

        var runProgram = "true"

        while runProgram == "true" {

        homePage()
        var userInput = readLine()
        let tabToOpen = userInput


        // ask teacher how to fix this
        if tabToOpen == "1" {
            print("How much kumara would you like to add?")
            userInput = readLine()!
            

                if kumaraAdded >= 0 && kumaraAdded <= binCapacityLeft {
                    currentStock = addKumara(currentStock: currentStock, amount: kumaraAdded)
                    printCurrentStock(currentStock: currentStock)

                } else if kumaraAdded > binCapacityLeft {
                    print("There is not enough space in the bin. Please add a number lower than \(binCapacityLeft)kgs.")
                    userInput = readLine()!
                    
                    currentStock = addKumara(currentStock: currentStock, amount: kumaraAdded)
                    printCurrentStock(currentStock: currentStock)
                
                } else if kumaraAdded < 0 {
                    print("You can not add a negative number. Please re-enter with a valid number.")
                    userInput = readLine()!
                    
                    currentStock = addKumara(currentStock: currentStock, amount: kumaraAdded)
                    printCurrentStock(currentStock: currentStock)
                
                } else {
                    generalInvalidInput()
                }


        } else if tabToOpen == "2" {
            print("How much kumara would you like to sell?")
            userInput = readLine()!
                currentStock = sellKumara(currentStock: currentStock, amount: kumaraSold)
                salePrice = calculateCostNoBag(sold: kumaraSold) + calculateBagCost(sold: kumaraSold)
                money = money + salePrice
                printSale(sale: kumaraSold, price: salePrice)
                printCurrentStock(currentStock: currentStock)

                

        } else if tabToOpen == "3" {
            printCurrentStock(currentStock: currentStock)


        } else if tabToOpen == "4" {
            print("You have made $\(money) from the Kumara Stall")


        } else if tabToOpen == "5" {
            print("Thank you for using Kumara Stall.")
            runProgram = "false"

        } else {
            generalInvalidInput()
        }


        }
        
}}