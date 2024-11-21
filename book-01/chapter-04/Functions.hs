module Functions where

-- ## Lambdas

-- > (\x -> 2*x) 4
-- 8

-- > (\x xs -> x : reverse xs) 'A' "UOIE"
-- "AEIOU"

-- ## High Order Functions

ev :: (Int -> Int) -> Int
ev f = 1 + f 5

dobro :: Int -> Int
dobro x = 2 * x

triplo :: Int -> Int
triplo x = 3 * x

-- > ev dobro
-- 11
-- > ev triplo
-- 16

-- ## Currying

somarTresNum :: Int -> Int -> Int -> Int
somarTresNum x y z = x + y + z

somarCurr :: Int -> Int
somarCurr = somarTresNum 4 5

-- ## map, foldl e filter

-- ### map

-- > map (+2) [1..5]
-- [3,4,5,6,7]

-- ### foldl

-- > foldl (+) 0 [1..4]
-- 10

-- > foldl (\xs s -> x:xs) [] "FATEC"
-- "CETAF"

-- ### filter

-- > filter (>0) [-4..4]
-- [1,2,3,4]

-- ### Função .

traseira :: String -> String
traseira [] = []
traseira (x:xs) = xs

contar :: String -> Int
contar = length

-- > contar(traseira "Haskell")
-- -- equivalente a:
-- > (contar . traseira) "Haskell"

-- :t (.)
-- (.) :: (b -> c) -> (a -> b) -> a -> c

-- :t traseira
-- traseira :: String -> String

-- > :t contar
-- contar :: String -> Int

-- > :t (contar . traseira)
-- contar . traseira :: String -> Int

-- ### Função $

-- > contar $ "Ola"
-- 3

-- > contar ("Ola" ++ "Alo")
-- 6

-- > contar $ "Ola" ++ "Alo"
-- 6

-- > :t ($)
-- ($) :: (a -> b) -> a -> b

-- ### Função |>

-- func :: String -> String
-- func x = x ++ (tail (take 3 (reverse x)))
-- func x = x ++ (tail . (take 3) . reverse $ x)

-- funcI :: String -> String
-- funcI x = x
-- |> reverse
-- |> take 3
-- |> tail
-- |> (x ++)

-- ## Sintaxe em funções

-- imc p a
--   | p / (a * a) <= 18.5 = "Abaixo do peso"
--   | p / (a * a) < 25 = "Peso normal"
--   | p / (a * a) <= 30 = "Acima do peso"
--   | otherwise = "Obesidade"

imc p a
  | valorImc <= 18.5 = "Abaixo do peso"
  | valorImc < 25 = "Peso normal"
  | valorImc <= 30 = "Acima do peso"
  | otherwise = "Obesidade"
  where
    valorImc = p / (a * a)

-- ## Recursão

fat n
  | n <= 1 = 1
  |otherwise = n * fat (n - 1)

rev :: String -> String
rev [] = []
rev (x:xs) = rev xs ++ [x]
