import Test.Hspec (describe, hspec, it, shouldBe)
import MidTerm2022 (encode, encode2, Student(..), Element(..), averageScores, student, scoreAsString, printAverages)
import qualified Data.Map as M

main :: IO ()
main = hspec $ do
  describe "encode" $ do
    it "encode 1" $ do
      encode "aaaabccaadeeee" `shouldBe` [(4, 'a'), (1, 'b'), (2, 'c'), (2, 'a'), (1, 'd'), (4, 'e')]
    it "encode empty" $ do
      encode "" `shouldBe` []
    it "encode 2" $ do
      encode "aaabbb" `shouldBe` [(3, 'a'), (3, 'b')]
    it "encode 3" $ do
      encode "aaabbbcc" `shouldBe` [(3, 'a'), (3, 'b'), (2, 'c')]

  describe "encode2" $ do
    it "encode 1" $ do
      encode2 "aaaabccaadeeee" `shouldBe` [Repeat 'a' 4, One 'b', Repeat 'c' 2, Repeat 'a' 2, One 'd', Repeat 'e' 4]
    it "encode empty" $ do
      encode2 "" `shouldBe` []
    it "encode 2" $ do
      encode2 "aaabbb" `shouldBe` [Repeat 'a' 3, Repeat 'b' 3]
    it "encode 3" $ do
      encode2 "aaabbbcc" `shouldBe` [Repeat 'a' 3, Repeat 'b' 3, Repeat 'c' 2]

  describe "student" $ do
    it "create student" $ do
      let s = student 1 "John"
      idNumber s `shouldBe` 1
      name s `shouldBe` "John"
    it "create student 2" $ do
      let s = student 2 "Jane"
      idNumber s `shouldBe` 2
      name s `shouldBe` "Jane"

  describe "averageScores" $ do
    it "average scores" $ do
      averageScores [(1, 10), (1, 20), (2, 30), (2, 40)] `shouldBe` M.fromList [(1, 15.0), (2, 35.0)]
    it "average scores 2" $ do
      averageScores [(1, 10), (1, 20), (1, 30), (1, 40)] `shouldBe` M.fromList [(1, 25.0)]
    it "average scores 3" $ do
      averageScores [(1, 10), (2, 20), (3, 30), (4, 40)] `shouldBe` M.fromList [(1, 10.0), (2, 20.0), (3, 30.0), (4, 40.0)]
    it "average scores 4" $ do
      averageScores [(1, 10), (2, 20), (1, 30), (2, 40)] `shouldBe` M.fromList [(1, 20.0), (2, 30.0)]
    it "average scores 5" $ do
      averageScores [(1, 10), (2, 20), (3, 30), (4, 40), (1, 50)] `shouldBe` M.fromList [(1, 30.0), (2, 20.0), (3, 30.0), (4, 40.0)]
    it "average scores 6" $ do
      averageScores [(1, 10), (2, 20), (3, 30), (4, 40), (1, 50), (2, 60)] `shouldBe` M.fromList [(1, 30.0), (2, 40.0), (3, 30.0), (4, 40.0)]
    it "average scores 7" $ do
      averageScores [(1, 10), (2, 20), (3, 30), (4, 40), (1, 50), (2, 60), (3, 70)] `shouldBe` M.fromList [(1, 30.0), (2, 40.0), (3, 50.0), (4, 40.0)]

  describe "scoreAsString" $ do
    let map = M.fromList [(1, 10.0), (2, 20.0), (3, 30.0), (4, 40.0)]
    it "score as string" $ do
      scoreAsString 1 map `shouldBe` "10.0"
    it "score as string 2" $ do
      scoreAsString 2 map `shouldBe` "20.0"
    it "score as string 3" $ do
      scoreAsString 3 map `shouldBe` "30.0"
    it "score as string 4" $ do
      scoreAsString 4 map `shouldBe` "40.0"