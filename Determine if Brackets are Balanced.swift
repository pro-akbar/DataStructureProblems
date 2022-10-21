class  Stack {
var list: [String] = []

func push(_ item: String) {
    self.list.append(item)
}

func pop() {
    self.list.removeLast()
}

func peek() -> String? {
    guard let lastItem = self.list.last else {
        return nil
    }
    return lastItem
}

func isEmpty() -> Bool {
    return self.list == []
}

}

func isMatched(_ openningBracket: String, _ closingBracket: String) -> Bool {
    return (openningBracket == "[" && closingBracket == "]") || 
    (openningBracket == "{" && closingBracket == "}") ||
    (openningBracket == "(" && closingBracket == ")")
}

func isParenBalenced(paren: String) -> Bool {
    let stack: Stack = Stack()
    let OPENNING_BRACKETS: String = "{(["
    let ALL_BRACKETS: String = "{[()}]"

    for bracket in paren {
        // Ignore if bracket have no any bracket
        if !ALL_BRACKETS.contains(bracket) { continue }

        if OPENNING_BRACKETS.contains(bracket) {
            stack.push(String(bracket))
            continue
        }

        if stack.isEmpty() {
            break
        }
            let top = stack.peek()
            stack.pop()

            if !isMatched(top!, String(bracket)) {
                break
            }
    }

    return stack.isEmpty()
}

print(isParenBalenced(paren: "()[(}{a})]"))
