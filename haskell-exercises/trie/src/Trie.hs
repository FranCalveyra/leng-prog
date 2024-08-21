module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit
  
--Trie a === Trie<T> in Java
data Trie a = Leaf a | (Trie a) :-: (Trie a) | Nil deriving (Show, Eq)
-- Add the Type definition deriving (Eq, Show)


--Should it be Trie a or Trie Char??? IDK
            
left::Trie a -> Trie a
left Nil = error "Exception: Left of Nil"
left (l :-: _) = l

right::Trie a -> Trie a
right Nil = error "Exception: Right of Nil"
right (_ :-: r) = r

find::Bits -> Trie a -> a
find [] _ = error "Trying to find nothing"
find _ Nil = error "Trying to find something on a null trie"
find bits trie = recFind 0 bits trie
  where
     recFind _ _ (Leaf x) = x
     recFind index b t = if b!!index == F then recFind (index + 1) b (left t) else recFind (index + 1) b (right t)

decode::Bits -> Trie Char -> String
decode [] _ = ""
decode _ Nil = error "Trying to decode a null trie"
decode bits trie = [find (take i bits) root | i<-[0..]]
  where
     root = trie

toList::Trie a -> [(a, Bits)]
toList = error "Define it"
