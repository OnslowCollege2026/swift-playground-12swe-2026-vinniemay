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
        let maximumItemVolume = 2.0

        let roomLength = readNumber(prompt: "Enter the room length:")
        let roomWidth = readNumber(prompt: "Enter the room width:")
        let roomHeight = readNumber(prompt: "Enter the room height:")

let roomArea = roomWidth*roomLength
print("Room area: \(roomArea)m²")
// calculates the are of the room and prints it out

let roomVolume = roomArea*roomHeight
print("Room volume: \(roomVolume)m³")
// calculates the volume of the room and prints it out

print("Furniture:")

let furnitureVolumes = [1.2, 0.8, 2.5, 0.6, 1.0]
// stores volumes of funiture in constant 
var totalFurnitureVolume = 0.0
furnitureVolumes.enumerated().forEach { index, volume in
print("Item \(index + 1): \(volume)m³") 
// prints out the volume of each item of furniture
if volume > maximumItemVolume {
    print("Oversized item detected.")
    //checks if the volume of an item is larger than the max, and if it is, prints a warning
}

totalFurnitureVolume = totalFurnitureVolume + volume
}
let usableVolume = roomVolume - totalFurnitureVolume
print("Usable volume: \(usableVolume)m³")
        
}}