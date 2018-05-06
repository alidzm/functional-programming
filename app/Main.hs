module Main where

import Combinators
import ChurchNumbers

main :: IO ()
main = putStrLn $ dec two (++ "!") "Hello"
