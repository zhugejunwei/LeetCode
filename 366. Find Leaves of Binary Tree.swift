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

// iteration, 28 ms
func findLeaves(root: TreeNode?) -> [[Int]] {
    var res = [[Int]]()
    var queue = [TreeNode]()
    if root == nil {
        return []
    }
    if root!.left == nil && root!.right == nil {
        return [[root!.val]]
    }
    while root!.left != nil || root!.right != nil {
        queue.append(root!)
        var tmp = [Int]()
        while !queue.isEmpty {
            let node = queue.first!
            queue.removeFirst()
            let left = node.left
            let right = node.right
            if left == nil && right == nil {
                queue.removeAll()
            }
            if left != nil {
                if left!.left == nil && left!.right == nil {
                    tmp.append(left!.val)
                    node.left = nil
                }else {
                    queue.append(left!)
                }
            }
            if right != nil {
                if right!.left == nil && right!.right == nil {
                    tmp.append(right!.val)
                    node.right = nil
                }else {
                    queue.append(right!)
                }
            }
        }
        res.append(tmp)
    }
    res.append([root!.val])
    return res
}


// recursion, find the height of every node. just return the nodes with the same height, 24 ms

var res = [[Int]]()

func findLeaves(root: TreeNode?) -> [[Int]] {
    height(root)
    return res
}

func height(node: TreeNode?) -> Int {
    if node == nil {
        return -1
    }
    let h = 1 + max(height(node!.left), height(node!.right))
    if h == res.count {
        res.append([])
    }
    res[h].append(node!.val)
    return h
}


var a = TreeNode(1), b = TreeNode(2), c = TreeNode(3), d = TreeNode(4), e = TreeNode(5)
a.left = b
a.right = c
b.left = d
b.right = e

findLeaves(a)

