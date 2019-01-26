import Data.List.Split

main :: IO ()
main = do
    inputs <- getContents
    let lines = splitOn "\n" inputs
    let result = forList (tail lines) 0 0
    putStrLn (show (fst result))
    putStrLn (show (snd result))

forList :: [String] -> Int -> Int -> (Int, Int)
forList [""] a b = (a, b)
forList lines a b = do
    let line = (head lines)
    let hands = splitOn " " line
    let akun = hands !! 0
        bkun = hands !! 1
    let ahand = handValue akun
    let bhand = handValue bkun
    let t = calcResult ahand bhand
    forList (tail lines) (a + (fst t)) (b + (snd t))

handValue :: String -> Int
handValue h
    | h == "g" = 0
    | h == "c" = 1
    | h == "p" = 2
    | otherwise = 0

calcResult :: Int -> Int -> (Int, Int)
calcResult a b = do
    let res = mod (a + 3 - b) 3
    case res of 0 -> (0, 0)
                1 -> (0, 1)
                2 -> (1, 0)

