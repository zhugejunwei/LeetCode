/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    int maxDepth(TreeNode* root) {
        queue<TreeNode*> q;
        q.push(root);
        int d=0;
        if(!root) return 0;
        while(!q.empty())
        {
            int sz = q.size();
            for(int i=0;i<sz; i++) // cannot use i<q.size() here!
            {
                int x=0; int y=0;
                TreeNode* n = q.front();
                if(n->left) q.push(n->left);
                if(n->right) q.push(n->right);
                q.pop();
            }
            ++d;
        }
        return d;
    }
};