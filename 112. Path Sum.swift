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

// recursion, 360 ms

func hasPathSum(root: TreeNode?, _ sum: Int) -> Bool {
    if root == nil { return false }
    if root?.val == sum && root?.left == nil && root?.right == nil {
        return true
    }
    return hasPathSum(root?.left, sum - root!.val) || hasPathSum(root?.right, sum - root!.val)
}

// iteration, 380 ms

func hasPathSum(root: TreeNode?, _ sum: Int) -> Bool {
    if root == nil { return false }
    var val = [root!.val]
    var stack = [root]
    while !stack.isEmpty && stack.first! != nil {
        var node = stack.last!; stack.popLast()
        var tempVal = val.last!; val.popLast()
        if node?.left == nil && node?.right == nil && tempVal == sum {
            return true
        }
        if node?.right != nil {
            stack.append(node?.right)
            val.append(node!.right!.val + tempVal)
        }
        if node?.left != nil {
            stack.append(node?.left)
            val.append(node!.left!.val + tempVal)
        }
    }
    return false
}