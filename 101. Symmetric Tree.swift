import Darwin

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// recursion, 160 ms

//func isSymmetric(root: TreeNode?) -> Bool {
//    if root == nil { return true }
//    return sym(root?.left, root?.right)
//}
//
//func sym(q: TreeNode?, _ p: TreeNode?) -> Bool {
//    if q == nil && p == nil {
//        return true
//    }else if q == nil || p == nil {
//        return false
//    }
//    return q?.val == p?.val && q?.left?.val == p?.right?.val && q?.right?.val == p?.left?.val && sym(q?.left, p?.right) && sym(q?.right, p?.left)
//}


// iteration, 128 ms

func isSymmetric(root: TreeNode?) -> Bool {
    if root == nil { return true }
    var q = [root?.left, root?.right]
    while !q.isEmpty {
        let left = q.first!; q.removeAtIndex(0)
        let right = q.first!; q.removeAtIndex(0)
        if left == nil && right == nil {
            continue
        }else if left == nil || right == nil {
            return false
        }else if left?.val != right?.val {
            return false
        }
        q.append(left?.left)
        q.append(right?.right)
        q.append(left?.right)
        q.append(right?.left)
    }
    return true
}


