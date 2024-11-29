module ParametricPolymorphism where

import Data.Monoid

-- 5.1 Tipos com parâmetros

-- data Coisa a = UmaCoisa a | DuasCoisas a a | ZeroCoisa

data Foo a b = Foo a b

data Arvore a = Nulo |
                Leaf a |
                Branch a (Arvore a) (Arvore a)
    deriving Show

emOrdem :: Arvore a -> [a]
emOrdem (Branch x l r) = emOrdem l ++ [x] ++ emOrdem r
emOrdem (Leaf x) = [x]
emOrdem Nulo = []

-- 5.2 Restrição de tipos em funções

-- foo :: a -> String
foo :: Show a => a -> String
foo x = "O valor de tipo a é: " ++ show x

-- 5.3 Classes de tipos (typeclass)

data Coisa a = Nada | UmaCoisa a | DuasCoisas a a
    -- deriving (Show, Eq)
    -- deriving Show
    deriving (Show, Read)

-- 5.3.1 Classe Eq

instance Eq a => Eq (Coisa a) where
    (DuasCoisas x1 y1) == (DuasCoisas x2 y2) = x1 == y2
    (UmaCoisa x) == (UmaCoisa y) = x == y
    Nada == Nada = True
    _ == _ = False

-- 5.3.2 Classe Show

-- instance Show a => Show (Coisa a) where
--     show Nada = "Nadinha..."
--     show (UmaCoisa x) = "Coisa com o elemento " ++ show x
--     show (DuasCoisas x y) = "Coisa com os elementos " ++ show x ++ " e " ++ show y

-- 5.3.3 Classe Read

lerCoisa :: Coisa Int -> Coisa Int
lerCoisa Nada = UmaCoisa 0
lerCoisa (UmaCoisa x) = UmaCoisa (x + 1)
lerCoisa (DuasCoisas x y) = DuasCoisas (2 * x) (y - 3)

-- > lerCoisa (read "Nada")
-- UmaCoisa 0
-- > lerCoisa (read "UmaCoisa 8")
-- UmaCoisa 9
-- > lerCoisa (read "DuasCoisas 1 2")
-- DuasCoisas 2 (-1)
-- > lerCoisa (read "DuasCoisas 1 2 3")
-- *** Exception: Prelude.read: no parse.

-- 5.4 Outras Classes

-- 5.4.1 Classe Num

-- 5.4.2 Classe Fractional

-- 5.4.3 Classe Real

-- 5.4.4 Classe Integral

-- 5.4.5 Classe Enum

data Dia = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado
    deriving (Show, Enum)

-- > succ Domingo
-- Segunda
-- > pred Segunda
-- Domingo

-- 5.4.6 Classe Ord

-- > "HASKELL" > "OLA"

-- 5.4.7 Classe Bounded

instance Bounded Dia where
    minBound = Domingo
    maxBound = Sabado

-- 5.4.8 Criando uma classe

class SimNao a where
    simnao :: a -> Bool

-- validação de idades
instance SimNao Int where
    simnao x
        | x < 18 = False
        | otherwise = True

instance SimNao [a] where
    simnao [] = False
    simnao _ = True

-- > simnao (10::Int)
-- False
-- > simnao "João"
-- True

-- 5.5 Monoides

-- elemento neutro é chamado de mempty
-- operação binária (funções infixas que recebem dois parâmetros, <>) é chamada de mappend

-- > Sum 5 <> Sum 6
-- Sum {getSum = 11}
-- > Product 5 <> Product 6
-- Product {getProduct = 30}

-- 5.5.1 Instâncias de Monoid

-- > mconcat [Sum 7, Sum 3, Sum 10]
-- Sum {getSum = 20}

-- > mconcat ["Ola Mundo", " Haskell", "!!!"]
-- "Ola Mundo Haskell!!!"
