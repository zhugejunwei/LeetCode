import Darwin

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// using an Array, 53 ms

func plusOne(head: ListNode?) -> ListNode? {
    var node = head
    var t = [node?.val]
    while node?.next != nil {
        node = node?.next
        t.append(node?.val)
    }
    var i = t.count - 1
    while i >= 0 {
        if t[i] < 9 {
            t[i]! += 1
            break
        }else {
            t[i] = 0
        }
        i -= 1
    }
    if t[0] == 0 {
        var res = Array(count: t.count + 1, repeatedValue: 0)
        res[0] = 1
        var n = ListNode(1)
        let headNode = n
        n.next = head
        n = n.next!
        n.val = 0
        while n.next != nil {
            n = n.next!
            n.val = 0
        }
        return headNode
    }else {
        var n = head
        var k = 0
        n?.val = t[k]!
        while n?.next != nil {
            k += 1
            n = n?.next
            n?.val = t[k]!
        }
    }
    return head
}


// recursion, 44 ms

func plusOne(head: ListNode?) -> ListNode? {
    var head = head
    if helper(head) == 1 {
        let tmp = head
        let preHead = ListNode(1)
        preHead.next = tmp
        head = preHead
    }
    return head
}

func helper(head: ListNode?) -> Int {
    let cur = head
    if cur?.next == nil {
        cur?.val += 1
    }else {
        cur?.val += helper(head?.next)
    }
    if cur!.val >= 10 {
        cur!.val -= 10
        return 1
    }
    return 0
}


// last 9s -> 0s, last !9 -> +1, all 9s -> 1 + 0...0, using two nodes to find and record the last 9, using dummy node to store the first node, 48 ms

func plusOne(head: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var i = dummy
    var j = dummy
    
    while j.next != nil {
        j = j.next!
        if j.val != 9 {
            i = j
        }
    }
    i.val += 1
    while i.next != nil {
        i = i.next!
        i.val = 0
    }
    if dummy.val == 0 {
        return dummy.next
    }else {
        return dummy
    }
}
