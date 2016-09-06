from sympy import *
import sys
sys.displayhook = pprint
def hw_simplify(numerator,denominator):
	print("("+str(numerator)+")/("+str(denominator)+")")
	print("("+str(factor(numerator))+")/("+str(factor(denominator))+")")
	print(str(factor(numerator)/factor(denominator)))
	for i in solve(denominator,x):
		print("x != "+str(i))
def hw_multiply(n1,d1,n2,d2):
	print(str(n1)+"/"+str(d1)+"*"+str(n2)+"/"+str(d2))
	numerator = n1 * n2
	denominator = d1 * d2
	print("("+str(factor(numerator))+")/("+str(factor(denominator))+")")
	print(str(factor(numerator)/factor(denominator)))
	for i in solve(denominator,x):
		print("x != "+str(i))
