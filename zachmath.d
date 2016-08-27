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
}
