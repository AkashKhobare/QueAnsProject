#include <stdio.h> 
#include <stddef.h>

int main(int argc, char const *argv[])
{
	//create a ll
	struct Linked_list ll;

	//initialize the ll
	initialize_linked_list(ll);

	//create a node
	createNode();




	return 0;
}

// define a node
struct Node {
	int node_data;
	Node* p_to_next_node;
};


// define a ll
struct Linked_list {
	int size;
	Node* nodes;
	Node head;
};


// initialize ll
void initialize_linked_list(Linked_list ll) {
	ll.head = null;
}


// create a node
Node create_node(int data) {
	struct Node n;

	


}


// add a node at start



// add a node at end



// delete a node



// traverse through ll
Node traverse(Linked_list ll) {
	if(ll.head == null) {
		printf("%s\n", "linked list is empty!");
	}
	else {
		while(ll->nodes->p_to_next_node != null) {
			printf(ll->nodes.data);
		}
	}
}

