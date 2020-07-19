-- "An integral trapeze artist" (c) by Ignacio Slater M.

-- "An integral trapeze artist" is licensed under a
-- Creative Commons Attribution 4.0 International License.

-- You should have received a copy of the license along with this
-- work. If not, see <http://creativecommons.org/licenses/by/4.0/>.
module Main where

import Lib

main :: IO()
main = do
  let f = \x -> 2*x^2 + 3*x^10 - x^6 + 10*x^30 - 8*x^25
      a = 0
      b = 100
      n = 20000
  print (pintegral f a b n)
  return ()
