module Fraction (Fraction, add, sub, mul, divide, hcf) where

type Fraction = (Int, Int)

-- Implement the `add` Function

add :: Fraction -> Fraction -> Fraction
add a b = (num,den)
          where
              (n1, d1) = a
              (n2, d2) = b
              num = n1*d2 + n2*d1
              den = d1*d2

-- Implement the `sub` Function

sub :: Fraction -> Fraction -> Fraction
sub a b = add a negB
          where
            (n2, d2) = b
            negB = (-1*n2, d2)


-- Implement the `mul` Function

mul :: Fraction -> Fraction -> Fraction
mul a b = (num,den)
          where
            (n1, d1) = a
            (n2, d2) = b
            num = n1*n2
            den = d1*d2

-- Implement the `divide` Function

divide :: Fraction -> Fraction -> Fraction
divide a b
  | n2 == 0 = error "Cannot divide by zero"
  | otherwise = mul a invertedB
  where
    (n2, d2) = b
    invertedB = (d2, n2)


-- Implement the `hcf` Function

hcf :: Int -> Int -> Int
hcf a b
  | b == 0 = a
  | otherwise = hcf b (a `mod` b)

--simplify :: Fraction -> Fraction
--simplify x = (a,b)
--    where
--      (n,d) = x
--      divisor = hcf n d
--      a = div n divisor
--      b = div d divisor


    