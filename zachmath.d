module zachmath;
class Fraction {
	private int numerator;
	private int denominator;
	private void reduce()
	{
		int m = 1;
		if(this.numerator<0)
		{
			m = -1;
			this.numerator = -this.numerator;
		}
		if(this.denominator<0)
		{
			m *= -1;
			this.denominator = -this.denominator;
		}
		if(this.denominator == 0)
		{
			assert(0);
		}
		int i = 2;
		while(this.numerator>=i && this.denominator>=i)
		{
			while(this.numerator%i==0 && this.denominator%i==0)
			{
				this.numerator/=i;
				this.denominator/=i;
			}
			i++;
		}
	}
	this(int n,int d)
	{
		this.numerator = n;
		this.denominator = d;
	}
	public string tostring()
	{
		return this.numerator.tostring ~ "/" ~ this.denominator.tostring;
	}
}
