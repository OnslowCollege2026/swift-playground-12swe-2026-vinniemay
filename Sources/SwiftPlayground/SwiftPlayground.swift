// The Swift Programming Language
// https://docs.swift.org/swift-book
@main
struct SwiftPlayground {
    static func main() throws {

        // The maximum number of guesses the user can make.
        let maximumGuesses = 5

        // The size of the board (width and height)
        let size = 6

        // The board you are playing on
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)

        // A record of guesses
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        // Placing the ships
        ocean[1][3] = "S"
        ocean[2][3] = "S"
        ocean[4][0] = "S"
        ocean[5][4] = "S"

        printBoard(guesses)

        // Allow the user to make a certain number of guesses
        var progress = 1
        while progress < maximumGuesses {
            // Ask for the row and column number
            print("\(progress): Please enter a row number, press Enter, then a column number: ")

            // Get the user's input for both the row and column
            // If the input is not usable, tell them to try again
            guard let userInput = readLine(),
                let row = Int(userInput),
                let userInput2 = readLine(),
                let col = Int(userInput2) else {
                print("Your guess is invalid. Try again.")
                continue
            }

            // By this point in the code, the row and col must be valid integers
            // Use processGuess to check that they are also valid guesses
            guesses = processGuess(row: row, col: col, ocean: ocean, guesses: guesses)

            // Print the updated guesses board, then go to the next move
            printBoard(guesses)
            progress = progress + 1
        }
    }
}

/// Parameter:
/// - board: The 2D grid to display.
func printBoard(_ board: [[String]]) {
    var columnLabels = "  "
    for i in 1...board.count {
        columnLabels = columnLabels + "\(i) "
    }
    print(columnLabels)

    for (index, row) in board.enumerated() {
        var rowString = "\(index + 1) "
        for cell in row {
            rowString = rowString + cell + " " 
        }
        print(rowString)
    }
}

/// Parameters:
/// - row: The row index for the guess.
/// - col: The column index for the guess.
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: The updated guesses grid after the guess is applied.
func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]] {
    // Make sure the row and column exist. If not, exit this function early.
    guard row >= 1, row <= ocean.count, col >= 1, col <= ocean[0].count else {
        print("Your guess is invalid. Please try again.")
        return guesses
    }

    // Make sure that the user hasn't already guessed the position.
    // If not, exit this function early.
    guard guesses[row - 1][col - 1] != "O" || guesses [row - 1][col - 1] != "X" else {
        print("You have already guessed that position. Please try again.")
        return guesses
    }

    // Make sure that the user hasn't missed the battleship.
    // If not, return an updated guesses table including the miss.
    guard guesses[row - 1][col - 1] == "~" else {
        print("MISS!")
        var newGuesses = guesses
        newGuesses[row - 1][col - 1] = "O"
        return newGuesses
    }


    // If the code hasn't returned by now, the player must have hit a ship.
    print("You've sunk my battelship!")
    var newGuesses = guesses
    newGuesses[row - 1][col - 1] = "X"
    return newGuesses
}

/// Parameters:
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: How many ships remain unhit.
func remainingShips(in ocean: [[String]], guesses: [[String]]) -> Int {
    var shipsCount = 0
    for row in 0...ocean.count-1 {
        for col in 0...row {
            if ocean[row][col] == "S" {
                shipsCount = shipsCount + 1
            }
        }
    }

    var hitCount = 0
    for row in 0...guesses.count-1 {
        for col in 0...row {
            if guesses[row][col] == "X" {
                hitCount = hitCount + 1
            }
        }
    }

return shipsCount - hitCount
}