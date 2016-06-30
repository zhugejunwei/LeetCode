/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */


// non-recursive way

class Solution {
public:
    TreeNode* invertTree(TreeNode* root) {
        std::queue<TreeNode*> nodequeue;
        if(root)
            nodequeue.push(root);
        else
            return root;
        TreeNode *node, *tmp;
        while(!nodequeue.empty())
        {
            node = nodequeue.front();
            nodequeue.pop();
            
            swap(node->left,node->right);
            
            if(node->left)
                nodequeue.push(node->left);
            if(node->right)
                nodequeue.push(node->right);
        }
        return root;
    }
    
};