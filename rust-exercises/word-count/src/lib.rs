use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(phrase: &str) -> HashMap<String, u32> {
  let words: Vec<&str> = phrase.split_whitespace().collect::<Vec<&str>>();
  let mut map: HashMap<String, u32> = HashMap::new();
  
  for word in words{
    let w = word.to_string().to_lowercase();     
    map.insert(w.clone(), map.get(&w).unwrap_or(&0) + 1);
  }
  
  map
}
