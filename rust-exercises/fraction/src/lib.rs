type Fraction = (i32, i32);

/// Add 2 fractions
pub fn add((n1, d1): Fraction, (n2, d2): Fraction) -> Fraction {
    if d1 == 0 || d2 == 0{
        panic!("Cannot divide by zero");
    }
    return (n1 * d2 + n2 * d1, d1 * d2) as Fraction;
}

/// Subtract 2 fractions
pub fn sub((n1, d1): Fraction, (n2, d2): Fraction) -> Fraction {
    return add((n1,d1), ((-1) * n2, d2));
}

/// Multiply 2 fractions
pub fn mul((n1, d1): Fraction, (n2, d2): Fraction) -> Fraction {
    return (n1 * n2, d1 * d2) as Fraction; 
}

/// Divide 2 fractions
pub fn divide((n1, d1): Fraction, (n2, d2): Fraction) -> Fraction {
    return mul((n1,d1), (d2,n2));
}

/// Calculate the Highest common factor between 2 numbers
pub fn hcf(a: i32, b: i32) -> i32 {
    if(b == 0){
        return a;
    }
    return hcf(b, a % b);
}

/// Create a fraction simplifying with the arguments simplified by the `hcf`
pub fn simplify(n: i32, d: i32) -> Fraction {
    let m = hcf(n,d);
    return (n/m, d/m) as Fraction;
}
