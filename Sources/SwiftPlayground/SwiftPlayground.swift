// The Swift Programming Language
// https://docs.swift.org/swift-book

func readNumber(prompt: String) -> Double {
    print([prompt])
    var returnValue = -1.0
    guard let input = readLine(), let number = Double(input), number > 0 else {
        print("Invalid number.")
        return readNumber(prompt: prompt)
    }
    returnValue = number
    return returnValue
}

@main
struct SwiftPlayground {
    static func main() {
        
}}