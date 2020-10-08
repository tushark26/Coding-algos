# -*- coding: utf-8 -*-
"""
Created on Wed Sep 30 12:52:29 2020

@author: tushar
"""
#Caution Doesnt work
class Node:
    def __init__(self, key):
        self.left = None
        self.right = None
        self.val = key



# A function to do preorder tree traversal
def helper(A,start,end):
    #print(start,end)
    #Base case
    if start>end:
        return None
    if start==end:
        return Node(A[start])

    #Recursive case
    mid = int(start+(end-start)/2)
    print(start,end,mid)

    rootnode = Node(A[mid])
    rootnode.left = helper(A,start,mid-1)
    rootnode.right = helper(A,mid+1,end)

    return rootnode



def overall(nums):
    return helper(nums,0,len(nums)-1)


# Driver code
nod = overall([-20,-10,-3,0,5,9,20])


print(nod.left.left.val)
print(nod.left.val)
print(nod.val)
print(nod.right.val)
print(nod.right.right.val)
