import Data.List.Split

main :: IO ()
main = do
    inputs <- getLine
    let nums = splitOn " " inputs
        numbers = getNumbers (read (nums !! 1) :: Int) (read (nums !! 2) :: Int) []
    printNumbers numbers (read (head nums) :: Int)
    
getNumbers :: Int -> Int -> [Int] -> [Int]
getNumbers min max numList
    | min < max = getNumbers (min + 1) max (numList ++ [min])
    | min == max = numList ++ [min]

padding :: String -> Int -> String
padding numst digit
    | length numst < digit = padding ('0' : numst) digit
    | length numst == digit = numst

printNumbers :: [Int] -> Int -> IO ()
printNumbers [] digit = return ()
printNumbers numbers digit = do
    let showNum = show (head numbers)
    putStrLn (padding showNum digit)
    printNumbers (tail numbers) digit

