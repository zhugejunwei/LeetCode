import Darwin

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let result = ListNode(0)
    var l3 = result
    var l11 = l1, l22 = l2
    var sum = 0
    while l11 != nil || l22 != nil {
        sum /= 10 // nice
        if l11 != nil {
            sum += l11!.val
            l11 = l11?.next
        }
        if l22 != nil {
            sum += l22!.val
            l22 = l22!.next
        }
        l3.next = ListNode(sum%10)
        l3 = l3.next!
    }
    if sum / 10 == 1 {
        l3.next = ListNode(1)
    }
    return result.next!
}
