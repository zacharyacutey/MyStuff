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
    return lambda x : x**(len(coefficients)-1)*coefficients[0] + list_to_polynomial(coefficients[1:])(x)

#Function that finds the factors of a number, then returns a set of those numbers
def factors(n):
  s = set()
  for i in range(abs(n)+1)[1:]:
    if abs(n) % i == 0:
      s |= {i,-i}
  return s

#Function that finds the possible divisions of two sets of roots
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
  s = set()
  for i in possible_solutions:
    if check_single_solution(i,fun):
      s|={i}
  return s

#Internals for the synthetic division work
def synthetic_division_work(poly,divisor):
  work = []
  result = [poly[0]]
  while len(result)!=len(poly):
    work.append(S(result[-1])*divisor)
    result.append(poly[len(result)]+work[-1])
  return [divisor,poly,work,result[:-1],result[-1]] #DIVISOR, DIVIDEND, ADDENDS, QUOTIENT, REMAINDER
def poly_division(poly,divisor):
  return synthetic_division_work(poly,divisor)[3]
#Displays the factors of the num `num`
def display_factors(num):
  s = factors(num)
  print("Factors of " + str(num) + " are: " + reduce(lambda x,y : x + y, str(s)[5:-2].split(',')))
def display_possible_roots(poly):
  s = possible_divisions(poly[1],poly[0])
  print("Possible roots of the equation (RRT) are: " + reduce(lambda x,y: x+y,str(s)[5:-2].split(',')))
def display_synth(synth):
  print(str(synth[0]) + "|\t" + reduce(lambda x,y : x + '\t' + y, str(synth[1])[1:-1].split(',')))
  print("\t\t" + reduce(lambda x,y : x + '\t' + y, str(synth[2])[1:-1].split(',')))
  print("\t" + reduce(lambda x,y : x + '\t' + y, str(synth[3])[1:-1].split(',')) + "\t|" + str(synth[4]))
def display_quadratic(a,b,c):
  print("("+str(-b) + "+sqrt(" + str(b**2) + "-" + str(4*a*c)+"))/"+str(2*a))
  print("("+str(-b) + "-sqrt(" + str(b**2) + "-" + str(4*a*c)+"))/"+str(2*a))
def quadratic(poly):
  if len(poly) != 3 and poly[0] == 0:
    return quadratic(poly[1:])
  assert(len(poly)==3)
  a = S(poly[0])
  b = S(poly[1])
  c = S(poly[2])
  return str((-b+sqrt(b**2-4*a*c))/(2*a)) + "," + str((-b-sqrt(b**2-4*a*c))/(2*a))

def sympy_poly(poly):
  from sympy.abc import x
  return list_to_polynomial(poly)(x)
def solve_problem(poly):
  print(sympy_poly(poly))
  p = poly[0]
  q = poly[-1]
  print("The coefficients are: (GREATEST DEGREE) "+str(p)+" (LEAST DEGREE) "+str(q))
  display_factors(p)
  display_factors(q)
  display_possible_roots(poly)
  assert(len(find_rational_roots(poly))>=0)
  the_root = list(find_rational_roots(poly))[0]
  f = sympy_poly([1,-the_root])
  print(str(f) + " is a factor")
  display_synth(synthetic_division_work(poly,S(the_root)))
  quad = poly_division(poly,the_root)
  other_f = sympy_poly(quad)
  print("(" + str(f) + ")(" + str(other_f) + ")")
  a = quad[0]
  b = quad[1]
  c = quad[2]
  display_quadratic(a,b,c)
  print("x = "+quadratic(quad)+","+str(the_root))
