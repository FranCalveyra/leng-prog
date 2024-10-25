use std::collections::HashSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    if factors.is_empty() || limit == 0 {
        return 0;
    }

    (factors[0]..limit)
        .filter(|&x| factors.iter().any(|&n| n != 0 && x % n == 0))
        .collect::<HashSet<_>>()
        .iter()
        .sum()
}