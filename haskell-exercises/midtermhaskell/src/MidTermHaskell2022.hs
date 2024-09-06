module MidTermHaskell2022 (encode, encode2, Student(..), Element(..), averageScores, student, scoreAsString, printAverages) where
import qualified Data.Map as Map

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

scoreAsString::Int -> Map.Map Int Double -> String
scoreAsString id map = toString $ Map.lookup id map
  where
    toString Nothing = "No Show"
    toString (Just x) = show x


printAverages::[Student] -> Map.Map Int Double -> IO ()
printAverages (x:xs) scores = do
  putStrLn (name x ++ " " ++ (scoreAsString (idNumber x) scores))
  printAverages xs scores
