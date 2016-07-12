import Darwin

// 236 ms
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func oddEvenList(head: ListNode?) -> ListNode? {
    if head == nil || head!.next == nil {
        return head
    }
    let result = head
    var cur = head
    var eventail = head?.next
    let evenHead = head?.next
    var tmp = evenHead!.next
    result!.next = nil
    evenHead!.next = nil
    var count = 1
    while tmp != nil {
        if count&0b1 == 1 {
            cur!.next = tmp
            cur = tmp
            tmp = tmp?.next
            cur!.next = nil
        }else {
            eventail!.next = tmp
            eventail = tmp
            tmp = tmp?.next
            eventail!.next = nil
        }
        count += 1
    }
    cur!.next = evenHead
    return result
}

//240 ms

func oddEvenList(head: ListNode?) -> ListNode? {
    if(head == nil || head!.next == nil) {
        return head;
    }
    var odd = head;
    var even = head?.next;
    var evenHead = even;
    while(odd!.next != nil && even!.next != nil) {
        odd!.next = even!.next;
        odd = odd!.next;
        even!.next = odd!.next;
        even = even!.next;
    }
    odd!.next = evenHead;
    return head;
}