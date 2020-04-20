(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class Main inherits IO {

   main() : Object {
       let nil:Node,
      	   n1:Node <- (new Node).init("hi\n"),
	   s:Stack <- (new Stack)
       in{
           s.push(n1);
           out_string(n1.getitem());
       
       }
           
      
   };

};


class Node{
    item: String;
    next: Node;
    prev: Node;
    
    init(t:String): Node{
      {
          item <- t;
	  self;
      }
    };


    getitem(): String{ item };

    getnext(): Node{ next };

    getprev(): Node{ prev };

    setprev(n: Node): Node{
        {
	    prev <- n;
	    self;
	}
    };
    
    setnext(n: Node): Node {
        {
	    next <- n;
	    self;
        }
    };
};

class Stack{
    size: Int <- 0;
    top: Node <- (new Node);

    push(n: Node): Stack{
        {
	    top.setnext(n);
	    top <- n;
	    size <- size + 1;
	    self;
	}

    };

    pop(): Node{
        {
	        
	    if (not size = 0) then
	        let topop: Node <- top,
		    newtop: Node <- topop.getprev()
		in {
		    top <- newtop;
		    size <- size - 1;
		    newtop.setnext((new Node));
		    topop;
		}
	    else
	        (new Node)
	    fi;
	}
    };
    

};
