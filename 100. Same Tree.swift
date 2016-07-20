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

// DFS, 36 ms

func isSameTree(p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    var pStack = [p]
    var qStack = [q]
    while !pStack.isEmpty && pStack.first! != nil && !qStack.isEmpty && qStack.first! != nil {
        let pNode = pStack.last!, qNode = qStack.last!
        if pNode!.val != qNode!.val {
            return false
        }
        pStack.popLast()
        qStack.popLast()
        if pNode!.right != nil && qNode!.right != nil {
            pStack.append(pNode?.right)
            qStack.append(qNode?.right)
        }else if (pNode!.right == nil && qNode!.right != nil) || (pNode!.right != nil && qNode!.right == nil) {
            return false
        }
        if pNode!.left != nil && qNode!.left != nil {
            pStack.append(pNode?.left)
            qStack.append(qNode?.left)
        }else if (pNode!.left == nil && qNode!.left != nil) || (pNode!.left != nil && qNode!.left == nil) {
            return false
        }
    }
    return p == nil || q == nil ? false : true
}


// Recursion, 36 ms

func isSameTree(p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    }else if p == nil || q == nil {
        return false
    }
    return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
}

