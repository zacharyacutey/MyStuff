from sympy import *
import sys
sys.displayhook = pprint
def hw_simplify(numerator,denominator):
	print("("+str(numerator)+")/("+str(denominator)+")")
	print("("+str(factor(numerator))+")/("+str(factor(denominator))+")")
	print(str(factor(numerator)/factor(denominator)))
	for i in solve(denominator,x):
		if not (i in solve(numerator/denominator)):
			print("x != "+str(i))
