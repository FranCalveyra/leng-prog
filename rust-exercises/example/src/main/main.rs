use std::mem;
fn main() {
    let num: u32 = 65;

    // Unsafe conversion of a u32 to a char
    let character: char = unsafe { mem::transmute(num) };

    println!("Character: {}", character);
}
// // Output
// Character: A

// Print usage in case of errors
//
fn usage() {
    println!("Usage:");
    println!("    hello <your name>");
    println!("    oblique_shot <angle in degrees> <velocity in m/s>");
}
