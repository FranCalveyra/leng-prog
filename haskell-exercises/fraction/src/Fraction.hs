module Fraction (Fraction, add, sub, mul, divide, hcf) where

type Fraction = (Int, Int)

-- Implement the `add` Function

first :: (Int, Int) -> Int
first (x,_) = x

second :: (Int, Int) -> Int
second (_,x) = x


add :: Fraction -> Fraction -> Fraction
add a b = (num, den)
   where
     num = first(a)*second(b) + first(b)*second(a)
     den = second(a)*second(b)

-- Implement the `sub` Function

sub :: Fraction -> Fraction -> Fraction
sub a b = (num, den)
     where
       num = first(a)*second(b) - first(b)*second(a)
       den = second(a)*second(b)

-- Implement the `mul` Function

mul :: Fraction -> Fraction -> Fraction
mul a b = (num, den)
  where
    num = first(a)*first(b)
    den = second(a)*second(b)

-- Implement the `divide` Function

divide :: Fraction -> Fraction -> Fraction
divide a b
  | first(b) == 0 = error "Cannot divide by zero"
  | otherwise = mul a invertedB
    where
    invertedB = (second(b), first(b))

-- Implement the `hcf` Function

hcf :: Int -> Int -> Int
hcf n d = error "Implement it"


    