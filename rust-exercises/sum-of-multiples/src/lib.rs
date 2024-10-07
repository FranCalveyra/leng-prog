use std::collections::HashSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut nums = HashSet::new();
    if(factors.is_empty() || limit == 0){
        return 0;
    }


    for x in factors[0]..limit {
        if isMultipleOfAny(x, factors){
            nums.insert(x);
        }
    }

    nums.iter().sum::<u32>()
}

fn isMultipleOfAny(x :u32, factors: &[u32]) -> bool {
    for n in factors{
        if *n == 0 {return false;}
        if x % n == 0{
            return true;
        }
    }
    false
}
