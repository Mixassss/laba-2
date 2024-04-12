import Data.Char

sumOfDigits :: Int -> Int
sumOfDigits n = sum $ map digitToInt (show n)

productOfDigits :: Int -> Int
productOfDigits n = product $ map digitToInt (show n)

findNumbers :: [Int] -> [Int]
findNumbers sequence = [i + 1 | (i, num) <- zip [0..] sequence, num >= 0, sumOfDigits num < productOfDigits num]

main :: IO ()
main = do
  let chisla = [3, 27, 14, 99]
      output = findNumbers chisla
  mapM_ (putStr . (++ " ") . show) output
  putStrLn ""
