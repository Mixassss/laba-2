сумма_цифр :: Int -> Int
сумма_цифр n = go n 0
  where
    go 0 acc = acc
    go n acc = go (n `div` 10) (acc + n `mod` 10)

произведение_цифр :: Int -> Int
произведение_цифр n = go n 1
  where
    go 0 acc = acc
    go n acc = go (n `div` 10) (acc * (n `mod` 10))

проверка_числа :: Int -> Bool
проверка_числа n = сумма_цифр n < произведение_цифр n

main :: IO ()
main = do
  let числа = [3, 27, 14, 99]
  let результаты = filter (\число -> проверка_числа число) числа
  mapM_ (\(номер, _) -> putStr (show номер ++ " ")) (zip [1..] результаты)
