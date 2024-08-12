module Lists (member, union, intersection, difference,
              insert, insertionSort, firsts,
              binaryToDecimal, toDecimal, toDec, decimal, firsts,
              binaryAdd) where
  
import Data.Char(digitToInt)  

member:: Int -> [Int] -> Bool
member _ []      = False
member e (x:xs)  = e == x || member e xs


union:: [Int] -> [Int] -> [Int]
union [] ys     = ys
union (x:xs) ys 
  | member x ys = union xs ys
  | otherwise   = x : union xs ys

intersection:: [Int] -> [Int] -> [Int]
intersection [] _ = []
intersection _ [] = []
intersection l1 l2 = [a | a <- l1, member a l2]


difference:: [Int] -> [Int] -> [Int]
difference [] a = []
difference a [] = a
difference l1 l2 = [a | a <- l1, not (member a l2)]

insert:: Int -> [Int] -> [Int]
insert b [] = [b]
insert b (x:xs)
      | b < x = b :(x:xs)
      | otherwise = x: (insert b xs)

insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)

binaryToDecimal :: [Int] -> Int
binaryToDecimal [] = 0
binaryToDecimal list = sum [x*2^i | (i, x) <- zip [0..] revList]
    where
      revList = reverse list
    
toDecimal :: Int -> [Int] -> Int
toDecimal _ [] = 0
toDecimal base list = sum [x*base^i | (i, x) <- zip [0..] revList]
    where
      revList = reverse list

toDec::Int -> String -> Int
toDec base "" = 0
toDec base s = sum [(digitToInt x)*base^i | (i, x) <- zip [0..] revList]
                   where
                     revList = reverse s

-- Same as `toDec` But use a list comprehension

decimal::Int -> String -> Int
decimal base "" = 0
decimal base s = sum [(digitToInt x)*base^i | (i, x) <- zip [0..] (reverse s)]

firsts::[a] -> [[a]]
firsts [] = []
firsts list = [take i list | i <- [1..length list] ]

-- Given two String that represents numbers in binary implement the 'binaryAdd' function
-- DO NOT USE a predefined '+' operation

binaryAdd::String -> String -> String
binaryAdd  = error "Implement it"
-- It's optional, so I ain't gonna do it :)
