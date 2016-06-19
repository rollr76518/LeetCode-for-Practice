//
//  226. Invert Binary Tree_Hanyu.swift
//  
//
//  Created by Ryan on 2016/6/19.
//
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func invertTree(root: TreeNode?) -> TreeNode? {
        
        if ((root?.left) != nil) && ((root?.right) != nil){
            let temp = root?.left
            root?.left  = root?.right
            root?.right = temp
        }
        
        
        if ((root?.left) != nil) && ((root?.right) == nil){
            root?.right = root?.left
            root?.left = nil
        }else if ((root?.left) == nil) && ((root?.right) != nil){
            root?.left = root?.right
            root?.right = nil
        }
        
        if ((root?.left) != nil) {
            Solution().invertTree(root?.left)
        }
        
        if ((root?.right) != nil) {
            Solution().invertTree(root?.right)
        }
        
        
        
        return root
    }
}