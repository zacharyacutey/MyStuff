from sympy import *
import sys
sys.displayhook = pprint
def hw_simplify(numerator,denominator):
 print("("+str(numerator)+")/("+str(denominator)+")")
 print("("+str(factor(numerator))+")/("+str(denominator)+")")
 print(str(factor(numerator)/factor(denominator)))
 print(solve(denominator))
