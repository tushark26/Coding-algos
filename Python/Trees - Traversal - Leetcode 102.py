
############################################################################
#######################Leet code 102 - BFS##################################
############################################################################

from collections import deque

# A node structure
class Node:

    # A utility function to create a new node
    def __init__(self ,key):
        self.data = key
        self.left = None
        self.right = None

# Iterative Method to print the height of a binary tree
def printLevelOrder(root):

    # Base Case
    if root is None:
        return

    # Create an empty queue for level order traversal
    queue = deque()

    # Enqueue Root and initialize height
    queue.append(root)
    result =[]

    while(len(queue) > 0):
        # Print front of queue and remove it from queue
        numNodes = len(queue)
        temp = []

        for i in range(numNodes):
            node = queue.popleft()
            temp.append(node.data)

            #Enqueue left child
            if node.left is not None:
                queue.append(node.left)

            # Enqueue right child
            if node.right is not None:
                queue.append(node.right)
        result.append(temp)
    return result

#Driver Program to test above function
root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left.left = Node(4)
root.left.right = Node(5)


print(printLevelOrder(root))