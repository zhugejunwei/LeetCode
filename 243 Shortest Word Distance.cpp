//
//  main.cpp
//
//
//  Created by 诸葛俊伟 on 2/16/16.
//  Copyright © 2016 诸葛俊伟. All rights reserved.
//

class Solution {
public:
    int shortestDistance(vector<string>& words, string word1, string word2)
    {
        int sz = words.size();
        int distance = sz-1;
        int near = -1;
        for (int i=0;i<sz;++i)
            if (words[i]==word1 || words[i]==word2)
            {
                if (near != -1 && words[i] != words[near]) distance = min(distance, i-near);
                near = i;
            }
        return distance;
    }
    
};