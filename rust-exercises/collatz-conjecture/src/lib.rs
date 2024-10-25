pub fn collatz(mut n: u64) -> Option<u64> {
    rec_collatz(n, 0)
}

fn rec_collatz(mut n: u64, mut counter: u64) -> Option<u64> {
    if n <= 0 {return None};
    if n == 1 {return Some(counter)};
    let num = if n % 2 == 0 {n / 2} else {(3 * n) +1};
    rec_collatz(num, counter + 1)
} 
