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
       let input: String,
           stream: IO <- (new IO),
	   s:Stack <- (new Stack)
       in{
           while (not input = "x") loop
	       {
	           stream.out_string("\n>");
		   input <- in_string();
		   
		   if (not input = "e") then
		       if (input = "d") then
		           s.display()
		       else
		           s.push((new Node).init(input))
		       fi
		   else
		       {
		       if (s.gettop().getitem() = "s") then
		           {
			       s.pop();
			       s.swap();
			   }
		       else
		           if (s.gettop().getitem() = "+") then
		               {
			           s.pop();
			           s.add();
			       }
			   else
			       true
		           fi
		
		       fi;
		       }
		   fi;
	       }
	   pool;
       
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



class Stack inherits A2I{
    size: Int <- 0;
    top: Node <- (new Node).init("head");


    gettop(): Node{ top };

    push(n: Node): Stack{
        {
	    n.setprev(top);
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

    swap(): Stack{
        
	let n1: Node <- pop(),
	    n2: Node <- pop()
	in {
	   push(n1);
	   push(n2);
	}
    };

    add(): Stack{        
        let n1: Node <- pop(),
	    n2: Node <- pop(),
	    newitem: Int <- a2i(n1.getitem()) + a2i(n2.getitem())
	in{
	    push((new Node).init(i2a(newitem)));
	}
    };

    display(): Node{
        let cur: Node <- top,
	    stream: IO <- (new IO)
	in {
	    while (not isvoid cur.getprev()) loop
	        {
		    stream.out_string("\n");
		    stream.out_string(cur.getitem());
		    cur <- cur.getprev();
		}
	    pool;
	    stream.out_string("\n");
	    cur;
	}
    };
};
