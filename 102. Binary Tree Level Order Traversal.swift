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

// BFS,  88 ms

func levelOrder(root: TreeNode?) -> [[Int]] {
    var q = [root]
    var result = [[Int]]()
    var level = 0
    while !q.isEmpty && q.first! != nil {
        let size = q.count
        var val = [Int]()
        for _ in 0..<size {
            let node = q.first!
            val.append((q.first!?.val)!)
            if node!.left != nil {
                q.append(node?.left)
            }
            if node!.right != nil {
                q.append(node?.right)
            }
            q.removeAtIndex(0)
        }
        level += 1
        result.append(val)
    }
    return result
}
