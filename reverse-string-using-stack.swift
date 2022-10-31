import Foundation

class  Stack {
var list: [String] = []

func push(_ item: String) {
    self.list.append(item)
}

func pop() -> String {
    return self.list.removeLast()
}

func isEmpty() -> Bool {
    return self.list == []
}

func length() -> Int {
    return self.list.count
}
}

func reverse(string: String) -> String {
    let s: Stack = Stack()
    var reverse: String = ""

    string.forEach {
        s.push(String($0))
    } 
    if s.isEmpty() { return "" }
    let SIZE: Int = s.length()
    var i: Int = 0

    while i < SIZE {
        reverse += s.pop()
        i += 1
    }

    return reverse
}

print(reverse(string: "abcd"))