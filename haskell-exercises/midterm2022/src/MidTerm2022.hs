module MidTerm2022 where
import qualified Data.Map as Map

-- Punto 1
encode:: String -> [(Int, Char)]
encode "" = []
encode (x:xs) = encode' 1 x xs
  where
     encode' count char "" = [(count, char)]
     encode' count char (y:ys)
      | y == char = encode' (count + 1) char ys
      | otherwise = [(count, char)] ++ (encode' 1 y ys)

--Punto 2
data Element = One Char | Repeat Char Int deriving (Show, Eq)
encode2::String -> [Element]
encode2 "" = []
encode2 string = [if n == 1 then One char else Repeat char n | (n, char) <- encode string]

-- Punto 3
--a)
data Student = Student{idNumber::Int, name::String}
student::Int -> String -> Student
student id newName = Student{idNumber=id, name=newName}

--b)
averageScores::[(Int,Int)] -> Map.Map Int Double
averageScores [] = Map.empty
averageScores students = Map.fromList (map calculateAverage (getScoreList students))
  where
    calculateAverage (id, scores) = (id, fromIntegral (sum scores) / fromIntegral (length scores))
    getScoreList [] = []
    getScoreList ((id, score): xs) = ((id, [score] ++ collectScores id xs) : getScoreList (filter ((/= id) .fst) xs))
    collectScores id ys = map snd (filter ((== id) . fst) ys)

--c)
scoreAsString:: Int -> Map.Map Int Double -> String
scoreAsString id studentMap = toStr $ Map.lookup id studentMap
  where
    toStr Nothing = "No Show"
    toStr (Just x) = show x

--d)
printAverages:: [Student] -> Map.Map Int Double -> IO ()
printAverages [] _ = return ()
printAverages (x:xs) studentMap = do
  putStrLn (name x ++ " " ++ scoreAsString (idNumber x) studentMap)
  printAverages xs studentMap