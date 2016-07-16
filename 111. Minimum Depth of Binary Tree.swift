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


// BFS, 393 ms

//func minDepth(root: TreeNode?) -> Int {
//    var q = [root]
//    var count = 0
//    while !q.isEmpty && q.first! != nil {
//        count += 1
//        let size = q.count
//        for _ in 0..<size {
//            let cur = q.first!
//            q.removeAtIndex(0)
//            if cur!.left == nil && cur!.right == nil {
//                return count
//            }
//            if cur!.left != nil {
//                q.append(cur!.left)
//            }
//            if cur!.right != nil {
//                q.append(cur!.right)
//            }
//        }
//    }
//    return count
//}

// DFS, 400 ms, 372 ms, in some cases where the tree is oddly unbalanced, BFS works much faster than DFS.

func minDepth(root: TreeNode?) -> Int {
    if root == nil { return 0 }
    if root!.left == nil && root!.right == nil {
        return 1
    }
    if root!.left == nil {
        return 1+minDepth(root?.right)
    }
    if root!.right == nil {
        return 1+minDepth(root?.left)
    }
    return min(minDepth(root?.left),minDepth(root?.right))+1
}