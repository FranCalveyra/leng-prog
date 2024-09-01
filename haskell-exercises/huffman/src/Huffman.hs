module Huffman  (huffmanTrie, encode, decode, Trie(..), Bit(..)) where

import qualified Data.Map as M
import Data.Tuple(swap)

data Bit = F | T deriving (Eq, Show)
type Bits = [Bit]
type Frequency = (Int, Char)

data Trie a = Empty
            | Leaf a
            | (Trie a) :-: (Trie a) deriving (Eq, Show, Ord)

--Interface

huffmanTrie::String -> Trie Char
huffmanTrie "" = Empty
huffmanTrie input = buildTrie (frequencies input)

encode :: String -> Trie Char -> Bits
encode input code = error "Implement it"
  
decode::Bits -> Trie Char -> String
decode bits trie = error "Implement it"


-- Aux methods (this module)
buildTrie:: [Frequency] -> Trie Char
buildTrie ((f1,x1):(f2,x2):xs)
  | buildTrie [] = Empty
  | xs == [] = if (maxFreq (f1,x1) (f2,x2)) == (f1,x1) then (Leaf x1) :-: (Leaf x2) else (Leaf x2) :-: (Leaf x1)
  | maxFreq (f1,x1) (f2,x2) == (f1,x1) = (Leaf x1) :-: (buildTrie (f2,x2):xs)
  | otherwise = (Leaf x2) :-: (buildTrie (f1,x1):xs)

maxFreq:: Frequency -> Frequency -> Frequency
maxFreq (f1, x1) (f2, x2)
 | max f1 f2 == f1 = (f1, x1)
 | otherwise = (f2, x2)
minFreq:: Frequency -> Frequency -> Char
minFreq (f1, x1) (f2, x2)
 | min f1 f2 == f1 = x1
 | otherwise = x2




-- Aux methods (Frequency module)
frequencies::String -> [Frequency]
frequencies "" = []
frequencies string = mergesort (map swap (getFrequencies string))

frequencyMap::(Ord a) => [a] -> M.Map a Int
frequencyMap list = M.fromList (mergesort ((getFrequencies list))) --I want to sort on O(n*log(n))

getFrequencies::(Eq a) => [a] -> [(a,Int)]
getFrequencies [] = []
getFrequencies (x:xs) = (x, count x (x:xs)) : getFrequencies (filter (/=x) xs)
  where
    count y = length . filter (==y)

merge:: (Ord a) => [a] -> [a] -> [a]
merge [] l2 = l2
merge l1 [] = l1
merge (x:xs) (y:ys)
  | x <= y = x: merge xs (y:ys)
  | otherwise = y: merge (x:xs) ys

mergesort:: (Ord a) => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort list = merge (mergesort firstHalf) (mergesort secondHalf)
  where
    (firstHalf, secondHalf) = splitAt mid list
    mid = (length list ) `div` 2