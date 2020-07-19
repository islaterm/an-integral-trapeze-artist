-- "An integral trapeze artist" (c) by Ignacio Slater M.

-- "An integral trapeze artist" is licensed under a
-- Creative Commons Attribution 4.0 International License.

-- You should have received a copy of the license along with this
-- work. If not, see <http://creativecommons.org/licenses/by/4.0/>.
module Lib
  ( pintegral
  )
where

import           Control.Parallel.Strategies
import           Data.List.Split


type Number = Double

-- parte (a)
integral :: (Number -> Number) -> Number -> Number -> Int -> Number
integral = undefined -- complete aquí su código


-- parte (b)
pintegral :: (Number -> Number) -> Number -> Number -> Int -> Number
pintegral = undefined -- complete aquí su código


-- parte (c)
-- Elapsed time sequential version: complete aquí
-- Elapsed time parallel version: complete aquí
-- Speedup: complete aquí

someFunc :: IO ()
someFunc = putStrLn "someFunc"
