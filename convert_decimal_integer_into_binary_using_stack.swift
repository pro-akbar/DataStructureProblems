import Foundation

class Stack {
    //Properties
private var list: [Int] = []

// Computed Properties
var isEmpty: Bool {
    return self.list == []
}
var pop: Int {
    return self.list.removeLast()
}
var size: Int {
    return self.list.count
}

// Methods
func push(_ item: Int) {
    self.list.append(item)
}
}

func convertIntoBinary(number: Int) -> String {
let s: Stack = Stack()
var _number: Int = number
var revserseNumber: String = ""
 while _number > 0 {
    let remainder: Int = _number % 2
    s.push(remainder)
    _number /= 2
 }
 
 while !s.isEmpty {
    revserseNumber += String(s.pop)
 }

return revserseNumber
}

print(convertIntoBinary(number: 120))