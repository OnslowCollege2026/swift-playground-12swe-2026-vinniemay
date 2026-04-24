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
    print("2) Current stock")
    print("3) Sale records")
    print("4) Close program")

}

func generalInvalidInput() {
    print("Invalid option. Please re-enter with a valid number.")
}

func addKumara(currentStock: Int, amount: Int) -> Int {
    return currentStock + amount
} 

@main
struct SwiftPlayground {
    static func main() {
        let bags = 5000 
        let kumaraKiloCost = 3
        let minimumKumara = 0.1
        let maxStock = 50

        var kumaraSold = 0 // kilos
        var kumaraAdded = 0 // kilos
        var currentStock = 50 // kilos

        var binCapacityLeft = maxStock - currentStock

        var runProgram = "true"

        while runProgram == "true" {

        homePage()
        var userInput = readLine()
        let tabToOpen = userInput


        // ask teacher how to fix this
        if tabToOpen == "1" {
            print("How much kumara would you like to add?")
            userInput = readLine()!
            kumaraAdded = Int(userInput)

                if kumaraAdded >= 0 && kumaraAdded <= binCapacityLeft {
                    currentStock = addKumara(currentStock: currentStock, amount: kumaraAdded)
                
                } else if kumaraAdded > binCapacityLeft {
                    print("There is not enough space in the bin. Please add a number lower than \(binCapacityLeft)")
                    userInput = readLine()!
                    kumaraAdded = Int(userInput)
                
                } else if kumaraAdded < 0 {
                    print("You can not add a negative number. Please re-enter with a valid number.")
                    userInput = readLine()!
                    kumaraAdded = Int(userInput)
                
                } else {
                    generalInvalidInput()
                }






        } else if tabToOpen == "2" {
            print("test 2")
        } else if tabToOpen == "3" {
            print("test 3")
        } else if tabToOpen == "4" {
            print("Thank you for using Kumara Stall.")
            runProgram = "false"
        } else {
            generalInvalidInput()
        }


        }
        
}}