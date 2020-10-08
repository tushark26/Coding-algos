# -*- coding: utf-8 -*-
"""
Created on Tue Sep 29 18:22:17 2020

@author: tusha
"""
global newTree
class TreeNode():
    def __init__(self, val=None, left_ptr=None, right_ptr=None):
        self.val = val
        self.left_ptr = left_ptr
        self.right_ptr = right_ptr



def flipUpsideDown(root):
    """Complete this function.
    Args: root (TreeNode): Root of the input tree
    Returns: TreeNode: Root of the output tree
    """
    global newTree
    #Edge case
    if not root:
        return

    #Base case
    if root.left_ptr is None and root.right_ptr is None:
       return root

    #Recursive case
    newTree = flipUpsideDown(root.left_ptr)

    #Circular reference -
    #https://media.geeksforgeeks.org/wp-content/cdn-uploads/tree42.png
    #Standard Template
    root.left_ptr.left_ptr = root.right_ptr
    root.left_ptr.right_ptr = root
    root.left_ptr = root.right_ptr = None

    return newTree


inputTree = TreeNode(1)
inputTree.left_ptr = TreeNode(2)
inputTree.right_ptr = TreeNode(4)
inputTree.left_ptr.left_ptr = TreeNode(4)
inputTree.left_ptr.right_ptr = TreeNode(5)
inputTree.left_ptr.left_ptr.left_ptr = TreeNode(6)
inputTree.left_ptr.left_ptr.right_ptr = TreeNode(7)


print(flipUpsideDown(inputTree))



