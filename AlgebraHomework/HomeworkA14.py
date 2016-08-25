from sympy import *
from functools import reduce
#Hacking the python functions to match Python 2
#MAP FUNCTION
old_map = map
map = lambda *args: list(old_map(*args))

#RANGE FUNCTION
old_range = range
range = lambda *args: list(old_range(*args))

#Basic list -> polynomial function
def list_to_polynomial(coefficients):
  if len(coefficients) == 1:
    return lambda x : coefficients[0]
  else:
    return lambda x : x**len(coefficients)*coefficients[0] + list_to_polynomial(coefficients[1:])(x)

#Function that finds the factors of a number, then returns a set of those numbers
def factors(n):
  s = set()
  for i in range(n+1)[1:]:
    if n % i == 0:
      s |= {i,-i}
  return s

#Function that finds the possible divisions of two roots
def possible_divisions(p,q):
  s = set()
  for i in factors(p):
    for j in factors(q):
      s |= {S(i) / S(j)}
  return s

#Checks a signle solution given a function
def check_single_solution(sol,fun):
  return fun(sol) == 0

#Finds the rational roots of the polynomial (list form) (returns set)
def find_rational_roots(poly):
  possible_solutions = possible_divisions(poly[-1],poly[0])
  fun = list_to_polynomial(poly)
  s = {}
  for i in possible_solutions:
    if check_single_solution(i,fun):
      s|=i
  return s

#Internals for the synthetic division work
def synthetic_division_work(poly,divisor):
  work = []
  result = [poly[0]]
  while len(result)!=len(poly):
    work.append(S(result[-1])*divisor)
    result.append(poly[len(result)]+work[-1])
  return [divisor,poly,work,result[:-1],result[-1]] #DIVISOR, DIVIDEND, ADDENDS, QUOTIENT, REMAINDER

def display_synth(synth):
  print str(synth[0]) + "|\t" + reduce(lambda x,y : x + '\t' + y, str(synth[1])[1:-1].split(','))
  print "\t" + reduce(lambda x,y : x + '\t' + y, str(synth[2])[1:-1].split(','))
  print "\t" + reduce(lambda x,y : x + '\t' + y, str(synth[3])[1:-1].split(',')) + "\t|" + str(synth[4])

