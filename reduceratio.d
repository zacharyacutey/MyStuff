import std.stdio;

bool is_divisible(int[] arr,int arg)
{
  int i = 0;
  while(i!=arr.length)
  {
    if(arr[i]%arg!=0)
    {
      return false;
    }
    i++;
  }
  return true;

}

void divide(ref int[] arr,int arg)
{
  int i = 0;
  while(i!=arr.length)
  {
    arr[i]/=arg;
    i++;
  }
}

int min(int[] arr)
{
  int r = arr[0];
  int i = 0;
  while(i!=arr.length)
  {
    if(arr[i]<r)
    {
      r=arr[i];
    }
    i++;
  }
  return r;
}

int[] reduced(int[] arg)
{
  int i = 2;
  while(i<=min(arg))
  {
    if(is_divisible(arg,i))
    {
      divide(arg,i);
    }
    i++;
  }
  return arg;
}

void reduce(ref int[] arg)
{
  arg=reduced(arg);
}

void main()
{
  int[] a=[4,2,8];
  writeln(reduced(a));
}
