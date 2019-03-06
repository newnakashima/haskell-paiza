import Text.Regex.Posix

main :: IO ()
main = do
    inputs <- getLine
    case inputs of
         i
            | not (i =~ "[0-9]" :: Bool)    -> putStrLn "Invalid"
            | not (i =~ "[a-zA-~]" :: Bool) -> putStrLn "Invalid"
            | (length i) < 6                -> putStrLn "Invalid"
            | otherwise                     -> checkChars (tail i) (head i) 0

checkChars :: String -> Char -> Int -> IO ()
checkChars _ _ 2 = putStrLn "Invalid"
checkChars [] _ _ = putStrLn "Valid"
checkChars chars last sameCount =
    if last == (head chars) then checkChars (tail chars) (head chars) (sameCount + 1)
                            else checkChars (tail chars) (head chars) 0
