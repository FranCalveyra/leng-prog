use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(phrase: &str) -> HashMap<String, u32> {
    let mut counts = HashMap::new();
    phrase
        .split_whitespace()
        .map(|word| word.to_string().to_lowercase())
        .for_each(|word| {
            *counts.entry(word).or_insert(0) += 1;
        });
    counts
}