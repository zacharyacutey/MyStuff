module stuff;
import std.stdio;
bool is_div(int[] arg,int val)
{
	int[] temp;
	int i=0;
	while(i!=arg.length)
	{
		temp~=arg[i]%val;
		i++;
	}
	i=0;
	while(i!=arg.length)
	{
		if(temp[i]!=0)
		{
			return false;
		}
		i++;
	}
	return true;
}
int get_min(int[] arg)
{
	int r=arg[0];
	int i;
	while(i!=arg.length)
	{
		if(r>arg[i])
		{
			r=arg[i];
		}
		i++;
	}
	return r;
}
bool is_reduce(int[] arg)
{
	int[] temp;
	int i=2;
	while(i<=get_min(arg))
	{
		if(is_div(arg,i))
		{
			return false;
		}
		i++;
	}
	return true;
}
void main()
{
}
