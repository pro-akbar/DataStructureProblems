class Node {
    var data: String = ""
    var next: Node? = nil

    init(data: String) {
        self.data = data
        self.next = nil
    }
}

class LinkedList {
    var head: Node?
    init() {
        self.head = nil
    }

    func append(data: String) {
        let newNode: Node = Node(data: data)
        guard let _head: Node = self.head else {
            self.head = newNode
            return
        }

        var lastNode: Node = _head
        while lastNode.next != nil{
            if let _lastNode: Node = lastNode.next {
                lastNode = _lastNode
            }
        }
        lastNode.next = newNode
    }

    func displayList() {
        var currentNode: Node? = self.head
        while currentNode != nil {
            print(currentNode!.data)
            currentNode = currentNode!.next
        }
    }

    func preAppend(data: String) {
        let newNode: Node = Node(data: data)
        newNode.next = self.head
        self.head = newNode
    }

    func insertAfter(node: Node?, data: String) {
        guard let previousNode: Node = node else { 
            print("Previous node doesn't exist.")
            return
        }

        let newNode: Node = Node(data: data)
        newNode.next = previousNode.next
        previousNode.next = newNode
    }

    func deleteNode(key: String) {
        guard let node: Node = self.head  else { 
            print("Linked list is empty.")
            return
        }
        var currentNode: Node? = node

        if currentNode?.data == key, let nextNode: Node = currentNode?.next {
         self.head = nextNode
         currentNode = nil
         return
        }

        var previousNode: Node? = nil
        while currentNode?.data != key {
            if currentNode == nil { 
                print("key can't match")
                return
                 }
            previousNode = currentNode
            currentNode = currentNode?.next
        }

        previousNode?.next = currentNode?.next
        currentNode = nil
    }

    func deleteNode(at pos: Int) {
        guard let head: Node = self.head else {
            print("Linked list is empty.")
            return
        }

        var currentNode: Node? = head
        if pos == 0 {
            self.head = currentNode?.next
            currentNode = nil
            return
        }

        var previousNode: Node? = nil
        var index: Int = 0
        while (currentNode != nil) && index != pos {
            previousNode = currentNode
            currentNode = currentNode?.next
            index += 1
        }

         if currentNode == nil{
            print("Can't find node at position " + String(pos))
            return
        }

        previousNode?.next = currentNode?.next
        currentNode = nil
    }

    func length() -> Int {
        guard var firstNode: Node = self.head else {
            return 0
        }

        var index: Int = 1
        while firstNode.next != nil {
            firstNode = firstNode.next!
            index += 1 
        }

        return index
    }

    func lengthAfter(node: Node?) -> Int {
        guard let _node = node else {
            return 0
        }
        return 1 + lengthAfter(node: _node.next)
    }

    func swapNodesWith(key1: String, key2: String) {
        if key1 == key2 {
            return
        }
        var previousNode: Node? = nil
        var currentNode: Node? = self.head

        while currentNode != nil && currentNode?.data != key1 {
            previousNode = currentNode
            currentNode = currentNode?.next
        }

        var previousNode1: Node? = nil
        var currentNode1: Node? = self.head

        while currentNode1 != nil && currentNode1?.data != key2 {
            previousNode1 = currentNode1
            currentNode1 = currentNode1?.next
        }

        guard let current1 = currentNode, let current2 = currentNode1 else {
            print("Nodes are not existed.")
            return
        }

        if let prev1 = previousNode {
            prev1.next = current2
        } else {
            self.head = current2
        }

        if let prev2 = previousNode1 {
            prev2.next = current1
        } else {
            self.head = current1
        }
        let tmpNode = current1.next
        current1.next = current2.next
        current2.next = tmpNode
    }

    func reverse() {
        var previousNode: Node? = nil
        var currentNode = self.head
        
        while currentNode != nil{
            let nextNode = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }
        self.head = previousNode
    }

    func reverseWith() {
        func _reverse(current: Node?, previous: Node?) -> Node? {
            var current = current
            var previous = previous

            if current == nil {
                return previous
            }

            let next = current?.next
            current?.next = previous
            previous = current
            current = next

            return _reverse(current: current, previous: previous)
        }
        
        self.head = _reverse(current: self.head, previous: nil)
    }

    func indexOf(key: String) -> Int? {
        var currentNode = self.head
        var index: Int = 0
        while currentNode != nil && currentNode?.data != key {
            currentNode = currentNode?.next
            index += 1
        }

        if currentNode == nil {
            print("Can't find node.")
            return nil
        }

        return index
    }

    func removeDupicate() {
        var currentNode = self.head
        var previousNode: Node? = nil
        var dupliDic: [String: String] = [:]

        while currentNode {
            if currentNode?.data in dupliDic {
                
            }
        }
    }
}

let linked: LinkedList = LinkedList()
linked.append(data: "A")
linked.append(data: "B")
linked.append(data: "C")
linked.append(data: "D")
// linked.deleteNode(at: 3)
// linked.preAppend(data: "E")
linked.reverse()
// linked.reverseWith()
print(linked.indexOf(key: "A"))

// print(linked.lengthAfter(node: linked.head))
// linked.swapNodesWith(key1: "B", key2: "D")
linked.displayList()