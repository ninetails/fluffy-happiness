module Exercises where

-- ## Exercício 1
media :: [Double] -> Double
-- media xs = sum xs / fromIntegral (length xs)
media xs = foldl (+) 0 xs / fromIntegral (length xs)

-- ## Exercício 2
checkPalindrome :: String -> Bool
checkPalindrome s = s == reverse s

filterPalindromes :: [String] -> [String]
filterPalindromes = filter checkPalindrome

-- ## Exercício 3
filterOdd :: [Int] -> [Int]
filterOdd = filter odd

filterEven :: [Int] -> [Int]
filterEven = filter even

-- ## Exercício 4

isPrime :: Int -> Int -> Bool
isPrime x y
    | x == 2 = True
    | y < 2 = True
    | x `mod` 2 == 0 = False
    | x == y = isPrime x (y - 2)
    | x `mod` y == 0 = False
    | otherwise = isPrime x (y - 2)

filterPrimes :: [Int] -> [Int]
filterPrimes = filter (\x -> isPrime x x)

-- ## Exercício 5

isMultipleOfFour :: Int -> Bool
isMultipleOfFour x = x `mod` 4 == 0

isNotMultipleOfFour :: Int -> Bool
isNotMultipleOfFour x = not (isMultipleOfFour x)

double' :: Int -> Int
double' x = x * 2

filterDoubleExcludingMultiplesOfFour :: [Int] -> [Int]
filterDoubleExcludingMultiplesOfFour = filter isNotMultipleOfFour . map double'

-- ## Exercício 6
func :: (String -> String) -> String -> String
func f s = (reverse s) ++ (f s)

-- ## Exercício 7
data Dia = Segunda | Terça | Quarta | Quinta | Sexta | Sábado | Domingo
    deriving Show

isTerca :: Dia -> Bool
isTerca Terça = True
isTerca _ = False

filterTercas :: [Dia] -> [Dia]
filterTercas = filter isTerca

-- ## Exercício 8
data Currency = Real | Dolar
    deriving Show
data Money = Money { value :: Double, currency :: Currency }
    deriving Show

convertToReal :: Money -> Money
convertToReal (Money v Dolar) = Money (v * 5.3) Real

convertToDolar :: Money -> Money
convertToDolar (Money v Real) = Money (v / 5.3) Dolar

-- isCurrency :: Currency -> Money -> Bool
-- isCurrency c (Money _ c) = True
-- isCurrency _ _ = False

-- filterCurrency :: Currency -> [Money] -> [Money]
-- filterCurrency c = filter (isCurrency c)

-- filterDolar :: [Money] -> [Money]
-- -- filterDolar = filter (\(Money _ c) -> c == Dolar)
-- filterDolar = filterCurrency Dolar

-- extractValues :: [Money] -> [Double]
-- extractValues = map (\(Money v _) -> v)

-- -- sumMoneyByCurrency :: Currency -> [Money] -> Money
-- -- sumMoneyByCurrency c ms = Money (foldl (+) 0 (map extractValues (filterCurrency c ms))) c

isDolar :: Money -> Bool
isDolar (Money _ Dolar) = True
isDolar _ = False

isReal :: Money -> Bool
isReal (Money _ Real) = True
isReal _ = False

isCurrency :: Currency -> Money -> Bool
isCurrency Dolar = isDolar
isCurrency Real = isReal

-- filterDolar :: [Money] -> [Money]
-- filterDolar = filter isDolar
filterCurrency :: Currency -> [Money] -> [Money]
filterCurrency c = filter (isCurrency c)

extractValues :: [Money] -> [Double]
extractValues = map (\(Money v _) -> v)

sumCurrency :: Currency -> [Money] -> Money
sumCurrency c ms = Money ((foldl (+) 0 . extractValues . (filterCurrency c)) ms) c

-- ## Exercício 9

singleCountNegative :: Int -> Int
singleCountNegative x
    | x < 0 = 1
    | otherwise = 0

accumulateCountNegatives :: Int -> Int -> Int
accumulateCountNegatives acc x = acc + singleCountNegative x

countNegatives :: [Int] -> Int
countNegatives = foldl accumulateCountNegatives 0

singleCountPChar :: Char -> Int
singleCountPChar x
    | x == 'p' = 1
    | x == 'P' = 1
    | otherwise = 0

accumulateCountPChars :: Int -> Char -> Int
accumulateCountPChars acc x = acc + singleCountPChar x

countPChars :: String -> Int
countPChars = foldl accumulateCountPChars 0

singleCountSabado :: Dia -> Int
singleCountSabado Sábado = 1
singleCountSabado _ = 0

accumulateCountSabados :: Int -> Dia -> Int
accumulateCountSabados acc x = acc + singleCountSabado x

countSabados :: [Dia] -> Int
countSabados = foldl accumulateCountSabados 0

singleCountDia :: Dia -> Int
singleCountDia Segunda = 1
singleCountDia Terça = 2
singleCountDia Quarta = 3
singleCountDia Quinta = 4
singleCountDia Sexta = 5
singleCountDia Sábado = 6
singleCountDia Domingo = 7

accumulateCountDias :: Int -> Dia -> Int
accumulateCountDias acc x = acc + singleCountDia x

countDias :: [Dia] -> Int
countDias = foldl accumulateCountDias 0

-- ## Exercício 10
