// 4 ms

class Solution {
public:
    int combinationSum4(vector<int>& nums, int target) {
        std::sort(nums.begin(), nums.end());
        vector<int> res(target + 1);
        res[0] = 1;
        for (int i = 1; i <= target; ++i) {
            for (int n : nums) {
                if (n > i) {
                    break;
                }
                if (n <= i) {
                    res[i] += res[i-n];
                }
            }
        }
        return res[target];
    }
};