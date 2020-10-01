# -*- coding: utf-8 -*-
"""
Created on Tue Sep 29 12:35:52 2020

@author: tusha
"""

class Node:
    # A utility function to create a new node
    def __init__(self ,key):
        self.val = key
        self.left_ptr = None
        self.right_ptr = None


def allBinaryTreePaths(root,result=[]):

    #Edge case
    if root is None:
        return

    result.append(str(root.val))

    #Base case: Leaf node
    if root.left_ptr is None and root.right_ptr is None:
        print(" ".join(result))

    #Recursive case:Internal nodes
    else:
        allBinaryTreePaths(root.left_ptr,result)
        allBinaryTreePaths(root.right_ptr,result)

    result.pop()

    return result





#Driver code to test above function
root = Node(1)
root.left_ptr = Node(2)
root.right_ptr = Node(3)
root.left_ptr.left_ptr = Node(4)
root.left_ptr.right_ptr = Node(5)
root.right_ptr.left_ptr = Node(6)
root.right_ptr.right_ptr = Node(7)


print(allBinaryTreePaths(root))