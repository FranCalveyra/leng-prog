module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = recursiveCollatz n 0

recursiveCollatz :: Integer->Integer -> Maybe Integer
recursiveCollatz n counter
  | n <= 0 = Nothing
  | n == 1 = Just counter
  | otherwise = recursiveCollatz number (counter + 1)
  where
  number = if (n `mod` 2) == 0 then (n `div` 2) else (3*n + 1)
