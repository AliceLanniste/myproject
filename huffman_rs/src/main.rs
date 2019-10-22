use std::collections::HashMap;

#[derive(Debug)]
struct Tree {
     data: Option<char>,
     freq: i64,
     left: Option<Box<Tree>>,
     right: Option<Box<Tree>>

}



type NodeSet = Vec<Box<Tree>>;

impl Tree {
    fn new(data:Option<char>, freq:i64) ->Self{
        Tree{
            data,
            freq,
            left: None,
            right: None
        }
    }

   fn merge(lnode:Box<Tree>, RNode: Box<Tree>) -> Self{
       let mut nnode = Tree::new(None, lnode.freq+RNode.freq);
       nnode.left = Some(lnode);
       nnode.right = Some(RNode);

       nnode
   }

}


fn assign_codes(p: &Box<Tree>, 
                h: &mut HashMap<char, String>,
                s: String ) {

    if let Some(ch) = p.data {
        h.insert(ch, s);
    } else {
        if let Some(ref l) = p.left {
            assign_codes(l, h, s.clone() + "0");
        }
        if let Some(ref r) = p.right {
            assign_codes(r, h, s.clone() + "1");
        }
    }
}


fn counter_freq(text: &str) -> HashMap<char,i64> {
        let mut map = HashMap::new();
        for s in text.chars() {
            let counter = map.entry(s).or_insert(0);
            *counter += 1;
        }

    map
}

fn make_tree(text:&str)  -> Tree{
    let h_map = counter_freq(text);
    let mut new_root:NodeSet= h_map.iter().map(|x| Box::new(Tree::new(Some(*(x.0)),*(x.1)))).collect();
   

    while new_root.len() > 1 {
        new_root.sort_by(|a,b| (&(b.freq)).cmp(&(a.freq)));
        let a = new_root.pop().unwrap();
        let b = new_root.pop().unwrap();
        
        let c = Box::new(Tree::merge(a, b));
        new_root.push(c);
    }

    let tree = new_root.pop().unwrap();
    *tree
    
}





fn decode(s:&str, root: &Box<Tree>) -> String {
    let mut decode_ptr = root;
    let mut text = "".to_string();

    for x in s.chars() {
        if x == '0' {
          if let Some(ref left) = decode_ptr.left {
              decode_ptr = left;
          } 
        } else {
            if let Some(ref right) =decode_ptr.right {
                decode_ptr= right;
            }
        }

        if let Some(ch) = decode_ptr.data {
            text.push(ch);
            decode_ptr =root;
        }
    }
   
    text
}




fn encode(s:&str, map:&HashMap<char, String>) -> String {
    
    let mut text = "".to_string();
    for ch in s.chars() {
        let t = map.get(&ch);
        text.push_str(t.unwrap());
    }
    
    text
}






fn main() {
     let msg = "Huffman coding is fun!";

     let tree = Box::new(make_tree(msg));
     let mut h:HashMap<char, String> = HashMap::new();
     assign_codes(&tree, &mut h, "".to_string());
      let enc = encode(msg, &h);
   
   
    println!("decoded = {:?}", decode(&enc, &tree));// "Huffman coding is fun!"

}


