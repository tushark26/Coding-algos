
############################################################################
#################Leet code 429 - BFS N-Ary Trees############################
############################################################################


from collections import deque

# A node structure
class Node:

    # A utility function to create a new node
    def __init__(self ,child,key):
        self.data = key
        self.children = []*child


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
            print(node.data)
            temp.append(node.data)
            #Since there is no concept of L/R subtrees in n-ary trees
            for child in node.children:
                queue.append(child)
        result.append(temp)
    return result

#Driver Program to test above function


n = 3
root = Node(n, 1)
root.children[0] = Node(n, 2)
root.children[1] = Node(n, 3)
root.children[2] = Node(n, 4)
root.children[0].children[0] = Node(n, 5)
root.children[0].children[1] = Node(n, 6)
root.children[0].children[2] = Node(n, 7)

print(printLevelOrder(root))
