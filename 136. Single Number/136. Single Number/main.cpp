//
//  136.cpp
//  QuickSort
//
//  Created by 诸葛俊伟 on 1/21/16.
//  Copyright © 2016 诸葛俊伟. All rights reserved.
//

#include <iostream>
#include <vector>
//#include <functional>   // std::bit_xor
using namespace std;

class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int value = 0;
        for (int i=0; i<nums.size(); ++i)
            value = value ^ nums[i];
        
        return value;
    }
};

int main()
{
    Solution solu;
    
    vector<int> v;
    v.push_back(1);
    v.push_back(2);
    v.push_back(4);
    v.push_back(1);
    v.push_back(2);
    
    int s = solu.singleNumber(v);
    
    cout<<s<<endl;
    return 0;
}
