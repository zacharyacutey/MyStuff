module zachmath;
class Fraction
{
	private int numerator;
	private int denominator;
	private void simplify()
	{
		assert(this.denominator != 0);
		int m = 1;
		if(this.denominator < 0)
		{
			m = -m;
			this.denominator *= -1;
		}
		if(this.numerator < 0)
		{
			m = -m;
			this.numerator *= -1;
		}
		int i = 2;
		while(this.numerator >= i && this.denominator >= i)
		{
			while(this.numerator % i + this.denominator % i == 0)
			{
				this.numerator/=i;
				this.numerator/=i;
			}
			i++;
		}
		if(this.numerator == 0)
		{
			this.denominator = 1;
			return;
		}
		this.numerator *= m;
	}
	this(int n,int d)
	{
		this.numerator = n;
		this.denominator = d;
		this.simplify();
	}
	public int getNumerator()
	{
		return this.numerator;
	}
	public int getDenominator()
	{
		return this.denominator;
	}
	public Fraction opAdd(Fraction rhs)
	{
		return new Fraction(this.getNumerator()*rhs.getDenominator()+rhs.getNumerator()*this.getDenominator(),
		this.getDenominator()*rhs.getDenominator());
	}
	public Fraction opNeg()
	{
		return new Fraction(-this.getNumerator(),this.getDenominator());
	}
	public Fraction opSub(Fraction rhs)
	{
		return this+(-rhs);
	}
	public Fraction opMul(Fraction rhs)
	{
		return new Fraction(this.getNumerator()*rhs.getNumerator(),this.getDenominator()*rhs.getDenominator());
	}
	public Fraction opDiv(Fraction rhs)
	{
		return this*(new Fraction(rhs.getDenominator(),rhs.getDenominator()));
	}
	public bool opEquals(Fraction rhs)
	{
		return this.getNumerator() == rhs.getNumerator() && this.getDenominator() == rhs.getDenominator();
	}
	public int opCmp(Fraction rhs)
	{
		int left = this.getNumerator() * rhs.getDenominator();
		int right = this.getDenominator() * rhs.getNumerator();
		if(left == right)
		{
			return 0;
		}
		else if(left < right)
		{
			return -1;
		}
		else
		{
			return 1;
		}
	}
}
