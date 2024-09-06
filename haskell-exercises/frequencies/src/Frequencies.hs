module Frequencies  (Frequency, frequencyMap, frequencies, insert, insertionSort, encode, encode2, Student(..), Element(..), averageScores, student) where

import Data.Map(Map)
import qualified Data.Map as Map
import Data.Tuple(swap)

type Frequency = (Int, Char)

frequencies::String -> [Frequency]
frequencies "" = []
frequencies string = mergesort (map swap (getFrequencies string))

frequencyMap::(Ord a) => [a] -> Map a Int
frequencyMap list = Map.fromList (mergesort ((getFrequencies list))) --I want to sort on O(n*log(n))

getFrequencies::(Eq a) => [a] -> [(a,Int)]
getFrequencies [] = []
getFrequencies (x:xs) = (x, count x (x:xs)) : getFrequencies (filter (/=x) xs)
  where
    count y = length . filter (==y)

insert::(Ord a) => a -> [a] -> [a]
insert b [] = [b]
insert b (x:xs)
  | b<x = b:(x:xs)
  | otherwise = x: (insert b xs)

insertionSort :: (Ord a) => [a] -> [a]
insertionSort [] = []
insertionSort (x:xs) = insert x (insertionSort xs)

-- Aux methods
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

-- Add exercises from MidTermHaskell2022
encode:: String -> [(Int, Char)]
encode ""     = []
encode (x:xs) = encode' 1 x xs
  where
    encode' n c "" = [(n,c)]
    encode' n c (y:ys)
      | c == y = encode' (n+1) c ys
      | otherwise = [(n,c)] ++ (encode' 1 y ys)

data Element = One Char | Repeat Char Int deriving (Show, Eq)

encode2::String -> [Element]
encode2 l = [if n == 1 then One char else Repeat char n | (n,char) <- encode l]


-- AVERAGE SCORES
data Student = Student{idNumber::Int, name::String}

student:: Int -> String -> Student
student id newName = Student{idNumber=id, name=newName}

averageScores:: [(Int, Int)] -> Map.Map Int Double
averageScores [] = Map.empty
averageScores list = Map.fromList (map calculateAverages (buildScoreMap list))
  where
    calculateAverages (id, scores) = (id, fromIntegral (sum scores) / fromIntegral (length scores))
    buildScoreMap [] = []
    buildScoreMap ((id, score):xs) = (id, scores id ((id, score):xs)) : buildScoreMap (filter ((/= id) . fst) xs)
    scores id ys = map snd (filter ((== id) . fst) ys)

