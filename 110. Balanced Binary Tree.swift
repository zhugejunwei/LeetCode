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

// DFS, top -> down, 484 ms

func isBalanced(root: TreeNode?) -> Bool {
    let left = height(root?.left)
    let right = height(root?.right)
    return root == nil ? true : abs(left-right) <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
}

func height(root: TreeNode?) -> Int {
    return root == nil ? 0 : max(height(root?.left),height(root?.right)) + 1
}


// DFS, bottom up, 444 ms, a little bit faster

func isBalanced(root: TreeNode?) -> Bool {
    return height(root) != -1
}

func height(root: TreeNode?) -> Int {
    if root == nil { return 0 }
    let left = height(root?.left)
    let right = height(root?.right)
    if left == -1 || right == -1 || abs(left - right) > 1 { return -1 }
    return max(left, right) + 1
}

