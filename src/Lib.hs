-- "An integral trapeze artist" (c) by Ignacio Slater M.

-- "An integral trapeze artist" is licensed under a
-- Creative Commons Attribution 4.0 International License.

-- You should have received a copy of the license along with this
-- work. If not, see <http://creativecommons.org/licenses/by/4.0/>.

-- v1.0-b.1
module Lib
  ( pintegral, integral
  )
where

import           Control.Parallel.Strategies
import           Data.List.Split


type Number = Double

{-| Computes an integral using the trapezoid rule method.
    Sequential version.
-}
integral :: (Number -> Number) -> Number -> Number -> Int -> Number
integral f a b n = h / 2 * sum (genPartitions 0)
 where
  h = (b - a) / fromIntegral n
  genPartitions i = if i > n
    then []
    else
      f (a + fromIntegral i * h)
      + f (a + fromIntegral (i + 1) * h)
      : genPartitions (i + 1)


-- parte (b)
pintegral :: (Number -> Number) -> Number -> Number -> Int -> Number
pintegral = undefined -- complete aquí su código


-- parte (c)
-- Elapsed time sequential version: complete aquí
-- Elapsed time parallel version: complete aquí
-- Speedup: complete aquí

someFunc :: IO ()
someFunc = putStrLn "someFunc"
