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

// BFS, 300 ms

//func maxDepth(root: TreeNode?) -> Int {
//    var count = 0
//    var q = [root]
//    var node = TreeNode?()
//    while !q.isEmpty && q.first! != nil {
//        let size = q.count
//        for _ in 0..<size {
//            node = q.first!
//            if node!.left != nil {
//                q.append(node?.left)
//            }
//            if node!.right != nil {
//                q.append(node?.right)
//            }
//            q.removeAtIndex(0)
//        }
//        count += 1
//    }
//    return count
//}


// DFS, 293 ms

func maxDepth(root: TreeNode?) -> Int {
    return root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
}

var a = TreeNode?()

maxDepth(a)