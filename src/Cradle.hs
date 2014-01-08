module Main
where

import System.Environment
import Cradle.Grammar
import Cradle.Generator.Nasm

main :: IO ()
main = getArgs >>= e . head

parse :: String -> Assign
parse s = case assign s of 
            Nothing -> error "Invalid assignment"
            Just (a, b) -> a

-- | Parse and print. Utility and test function for use in @ghci@.
p = putStrLn . show . parse

-- | Parse and emit.
e = putStrLn . emit . parse