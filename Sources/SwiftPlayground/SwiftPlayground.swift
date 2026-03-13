// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Parameter:
/// - board: The 2D grid to display.
func printBoard(_ board: [[String]]) {
    print()
}

@main
struct SwiftPlayground {
    static func main() {
        let size = 6
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)
            ocean[1][3] = "S"
            ocean[2][3] = "S"
            ocean[4][0] = "S"
            ocean[5][4] = "S"

        var rowLabel = " "

    for i in 0..<board.count {
        rowLabel = rowLabel + "\(i)"
    }
    }
}