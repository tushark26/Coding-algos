
############################################################################
### LC 105 - Construct Binary Tree using Inorder and Preorder Traversal ####
############################################################################

global hmap
hmap = {}
class Node:
    def __init__(self, key):
        self.left = None
        self.right = None
        self.val = key



def helper(P,startP,endP,I,startI,endI):
    #base case
    if startP>endP:
        return None
    if startP==endP:
        return Node(P[startP])


    #recursive case
    rootnode = Node(I[startI+1])
    rootindex = hmap[P[startP]]
    numleft = rootindex - startI
    numright = endI - rootindex
    rootnode.left = helper(P,startP+1,startP+numleft,I,startI,rootindex-1)
    rootnode.right= helper(P,startP+numleft+1,endP, I, rootindex+1, endI)
    return rootnode


def overall(preorder, inorder):
    global hmap
    hmap = {}
    for i in range(0,len(inorder)-1):
        hmap[inorder[i]]=i
    return helper(preorder,0,len(preorder)-1,inorder,0,len(inorder)-1)


inorder = [9,3,15,20,7]
preorder= [3,9,20,15,7]

nd = overall(preorder,inorder)
print(nd.val)
print(nd.left.val)
print(nd.right.val)
print(nd.right.left.val)
print(nd.right.right.val)