//
//  main.cpp
//
//
//  Created by 诸葛俊伟 on 2/9/16.
//  Copyright © 2016 诸葛俊伟. All rights reserved.
//

class Solution {
public:
    vector<string> generatePossibleNextMoves(string s) {
        vector<string> result;
        if(s.size() <= 1)
            return result;
        for (int i = 0; i < s.size()-1; ++i)
        {
            if(s[i] == s[i+1] && s[i] == '+')
            {
                string temp = s;
                temp[i] = '-';
                temp[i+1] = '-';
                result.push_back(temp);
            }
        }
        return result;
    }
};