import UIKit

func splitIntoPairs<T>(array: [T]) -> [[T]] {
    var result: [[T]] = []
    var index = 0
    
    while index < array.count {
        let end = min(index + 2, array.count) // Asegura que no exceda los límites del array
        result.append(Array(array[index..<end]))
        index += 2
    }
    
    return result
}

// Ejemplo de uso
let array = ["uno", "dos", "tres", "cuatro", "cinco"]
let pairs = splitIntoPairs(array: array)
print(pairs) // Salida: [["uno", "dos"], ["tres", "cuatro"], ["cinco"]]

