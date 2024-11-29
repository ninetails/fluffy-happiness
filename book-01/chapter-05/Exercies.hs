module Exercises where

import Data.Monoid
import Data.Semigroup ((<>))

-- ## Exercício 1

data TipoProduto = Escritorio | Informatica | Livro | Filme | Total deriving Show

data Produto = Produto { valor :: Double,
                         tp :: TipoProduto }
              | Nada deriving Show

instance Monoid Produto where
    mempty = Nada

instance Semigroup Produto where
    Nada <> p = p
    p <> Nada = p
    (Produto valor1 tp1) <> (Produto valor2 tp2) = Produto  (valor1 + valor2) Total

-- ## Exercício 2

totalGeral :: [Produto] -> Double
-- totalGeral = foldr (\p acc -> valor p + acc) 0
totalGeral = valor . mconcat

-- ## Exercício 3

data Min = Min Int deriving (Ord, Eq, Show)

instance Monoid Min where
    mempty = Min (maxBound :: Int)

instance Semigroup Min where
    Min x <> Min y = Min (min x y)

-- ## Exercício 5

data Paridade = Par | Impar deriving Show

class ParImpar a where
    decide :: a -> Paridade

instance ParImpar Int where
    decide x = if even x then Par else Impar

instance ParImpar [a] where
    decide x = if even (length x) then Par else Impar

instance ParImpar Bool where
    decide x = if x then Impar else Par

-- ## Exercício 6

data Max = Max Int deriving (Ord, Eq, Show)

instance Monoid Max where
    mempty = Max (minBound :: Int)

instance Semigroup Max where
    Max x <> Max y = Max (max x y)

maxAll :: [Max] -> Max
maxAll = mconcat

-- ## Exercício 7

data Arvore a = Nulo |
                Leaf a |
                Branch a (Arvore a) (Arvore a)
    deriving Show

mapa :: (a -> b) -> Arvore a -> Arvore b
mapa f Nulo = Nulo
mapa f (Leaf x) = Leaf (f x)
mapa f (Branch x l r) = Branch (f x) (mapa f l) (mapa f r)

-- ## Exercício 8

-- > mapa (+5) (Branch 10 (Leaf 20) (Leaf 30))
-- Branch 15 (Leaf 25) (Leaf 35)

-- ## Exercício 10

sumArvore :: Num a => Arvore a -> a
sumArvore Nulo = 0
sumArvore (Leaf x) = x
sumArvore (Branch x l r) = x + sumArvore l + sumArvore r

-- ## Exercício 12

insertArvore :: Ord a => a -> Arvore a -> Arvore a
insertArvore x Nulo = Leaf x
insertArvore x (Leaf y) = if x < y then Branch y (Leaf x) Nulo else Branch y Nulo (Leaf x)
insertArvore x (Branch y l r) = if x < y then Branch y (insertArvore x l) r else Branch y l (insertArvore x r)

-- ## Exercício 13

listToArvore :: Ord a => [a] -> Arvore a
listToArvore = foldr insertArvore Nulo
