# -*- coding: utf-8 -*-
"""
Created on Tue Sep 29 11:09:36 2020

@author: tusha
"""



global result
result = []
# A node structure
class Node:

    # A utility function to create a new node
    def __init__(self ,key):
        self.val = key
        self.left_ptr = None
        self.right_ptr = None

# Iterative Method to print the height of a binary tree
def allPathsOfABinaryTree(root,stack=[]):
    global result

    # Base Case
    if root is None:
        return

    stack.append(root.val)
    if root.left_ptr is None and root.right_ptr is None:
        result.append(''.join(str(i) for i in stack))
        print(''.join(str(i) for i in stack))


    allPathsOfABinaryTree(root.left_ptr,stack)
    allPathsOfABinaryTree(root.right_ptr,stack)

    stack.pop()
    return result


#Driver Program to test above function
root = Node(1)
root.left_ptr = Node(2)
root.right_ptr = Node(3)
root.left_ptr.left_ptr = Node(4)
root.left_ptr.right_ptr = Node(5)
root.right_ptr.left_ptr = Node(6)
root.right_ptr.right_ptr = Node(7)


print(allPathsOfABinaryTree(root))


