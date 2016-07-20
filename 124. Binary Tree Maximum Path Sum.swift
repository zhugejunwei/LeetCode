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

/*
 1. calculate top two biggest pathsums passing through every node in the every level.
 2. calculate the sum of those two pathsums
 3. get the biggest val of the sums
 */

// solution from other people, 996 ms

var maxValue = Int.min

func maxPathSum(root: TreeNode?) -> Int {
    maxSum(root)
    return maxValue
}

func maxSum(root: TreeNode?) -> Int {
    if root == nil { return 0 }
    let left = max(0, maxSum(root?.left))
    let right = max(0, maxSum(root?.right))
    maxValue = max(left + right + root!.val, maxValue)
    return max(left, right) + root!.val
}
