module Exercises where

-- ## Exercício 1
{-
data Pergunta = Sim | Nao
    deriving Show

pergNum :: Pergunta -> Int
pergNum Nao = 0
pergNum Sim = 1

listPergs :: [Pergunta] -> [Int]
listPergs xs = [pergNum x | x <- xs]

and' :: Pergunta -> Pergunta -> Bool
and' Sim Sim = True
and' _ _ = False

or' :: Pergunta -> Pergunta -> Bool
or' Nao Nao = False
or' _ _ = True

not' :: Pergunta -> Bool
not' Nao = True
not' Sim = False
-}

-- Exercício 2

data Temperatura = Celsius | Farenheight | Kelvin
    deriving Show

converterCelsius :: Double -> Temperatura -> Double
converterCelsius x Celsius = x
converterCelsius x Farenheight = (x - 32) / 1.8
converterCelsius x Kelvin = x - 273.15

-- Done using Copilot

-- Exercício 3

data Jokenpo = Pedra | Papel | Tesoura
    deriving Show

jokenpo :: Jokenpo -> Jokenpo -> String
jokenpo Pedra Pedra = "Empate"
jokenpo Papel Papel = "Empate"
jokenpo Tesoura Tesoura = "Empate"
jokenpo Pedra Papel = "Papel vence"
jokenpo Pedra Tesoura = "Pedra vence"
jokenpo Papel Pedra = "Papel vence"
jokenpo Papel Tesoura = "Tesoura vence"
jokenpo Tesoura Pedra = "Pedra vence"
jokenpo Tesoura Papel = "Tesoura vence"

-- Exercício 4

removeCharacters :: String -> String
removeCharacters xs = [x | x <- xs, x `notElem` ['a'..'z'], x `notElem` ['A'..'Z']]

-- Exercício 5
data Imperial = Inch | Yard | Foot
    deriving Show

converterMetros :: Imperial -> Double -> Double
converterMetros Inch x = (x * 0.0254)
converterMetros Yard x = (x * 0.9144)
converterMetros Foot x = (x * 0.3048)

converterImperial :: Double -> Imperial -> Double
converterImperial x Inch = (x / 0.0254)
converterImperial x Yard = (x / 0.9144)
converterImperial x Foot = (x / 0.3048)

-- Exercício 8

filterEight :: [Int] -> [Int]
filterEight xs = reverse [x | x <- xs, x `mod` 2 /= 0, x `mod` 7 /= 0, x >= 0]

-- Exercício 9
reverseTriple :: String -> String -> String -> (String, String, String)
reverseTriple x y z = (reverse x, reverse y, reverse z)

-- Exercício 10
revNum :: String -> Int -> String
revNum x y = reverse (take y x) ++ drop y x

-- Exercício 11
data Binario = Zero | Um
    deriving Show

data Funcao = Soma2 | Maior | Menor | Mult2
    deriving Show

aplicar :: Funcao -> Binario -> Binario -> Binario
aplicar Soma2 Um Um = Zero
aplicar Soma2 Zero Zero = Zero
aplicar Soma2 _ _ = Um
aplicar Maior Um Zero = Um
aplicar Maior _ _ = Zero
aplicar Menor Zero Um = Um
aplicar Menor _ _ = Zero
aplicar Mult2 Um Um = Um
aplicar Mult2 _ _ = Zero

-- Exercício 12

convertBinarioToInt :: Binario -> Int
convertBinarioToInt Um = 1
convertBinarioToInt Zero = 0

binList :: [Binario] -> [Int]
binList xs = [convertBinarioToInt (aplicar Soma2 Um x) | x <- xs]

-- Exercício 14

data Valido = Sim String | Nao
    deriving Show

isNomeValido :: String -> Valido
isNomeValido "" = Nao
isNomeValido x = Sim x

-- Exercício 16
{-
data Numero = Numero Double | Erro String
    deriving Show

dividir :: Numero -> Numero -> Numero
dividir (Numero x) (Numero 0) = Erro "Divisão por zero"
dividir (Numero x) (Numero y) = Numero (x / y)
-}

-- Exercício 17

data Cripto = Mensagem String | Cifrado String | Erro
    deriving Show

encriptarLetra :: Char -> Char
encriptarLetra 'Z' = 'A'
encriptarLetra x = succ x

decriptarLetra :: Char -> Char
decriptarLetra 'A' = 'Z'
decriptarLetra x = pred x

encriptar :: Cripto -> Cripto
encriptar (Cifrado xs) = Erro
encriptar (Mensagem xs) = Cifrado [encriptarLetra x | x <- xs]
encriptar (Erro) = Erro

decriptar :: Cripto -> Cripto
decriptar (Mensagem xs) = Erro
decriptar (Cifrado xs) = Mensagem [decriptarLetra x | x <- xs]
decriptar (Erro) = Erro

-- Exercício 19

data Cambio = Euro | Real | Dolar
    deriving Show

data Moeda = Moeda {valor :: Double, cambio :: Cambio}
    deriving Show

conversao :: Moeda -> Cambio -> Moeda
conversao (Moeda { valor = x, cambio = Real }) Euro = Moeda { valor = (x * 0.18), cambio = Euro }
conversao (Moeda { valor = x, cambio = Euro}) Real = Moeda { valor = (x / 0.18), cambio = Real }
conversao (Moeda { valor = x, cambio = Real}) Dolar = Moeda { valor = (x * 0.19), cambio = Dolar }
conversao (Moeda { valor = x, cambio = Dolar}) Real = Moeda { valor = (x / 0.19), cambio = Real }
conversao (Moeda { valor = x, cambio = Euro}) Dolar = Moeda { valor = (x * 1.09), cambio = Dolar }
conversao (Moeda { valor = x, cambio = Dolar}) Euro = Moeda { valor = (x / 1.09), cambio = Euro }
conversao (Moeda { valor = x, cambio = Real }) Real = Moeda { valor = x, cambio = Real }
conversao (Moeda { valor = x, cambio = Euro }) Euro = Moeda { valor = x, cambio = Euro }
conversao (Moeda { valor = x, cambio = Dolar }) Dolar = Moeda { valor = x, cambio = Dolar }


-- Exercício 20
converterTodosReal :: [Moeda] -> [Moeda]
converterTodosReal xs = [conversao x Real | x <- xs]

-- Exercício 21

maxMoeda :: [Moeda] -> Double
maxMoeda xs = maximum [valor x | x <- xs]
