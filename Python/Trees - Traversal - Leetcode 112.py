
############################################################################
################Leet code 112 - PATH SUM ###################################
############################################################################

##########
# LC 112 Leverage DFS template for Top down traversal
##########

solutionFound = False

class Node:
    def __init__(self, key):
        self.left = None
        self.right = None
        self.val = key

# A function to do preorder tree traversal
def dfs(node,target):

    #Base case
    if node.left is None and node.right is None:
        if target==node.val:
            #print('solutionFound = True')
            global solutionFound
            solutionFound = True
            #print(solutionFound)
            return solutionFound

    #Recursive case
    if node.left is not None:
        # Then recur on left child
        dfs(node.left, target-node.val)

    if node.right is not None:
        # Finally recur on right child
        dfs(node.right,target-node.val)


def overall(root,sum):
    if root is None:
        return False
    dfs(root,sum)
    return solutionFound


# Driver code
root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left.left = Node(4)
root.left.right = Node(5)
print(overall(root,5))
