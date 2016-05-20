int[2] reduced_fraction(int[2] arg)
{
  int i = 2;
  while(i <= arg[0])
  {
    while(arg[0] % i == 0 && arg[1] % i == 0)
    {
      arg[0] /= i;
      arg[1] /= i;
    }
    i++;
  }
  return arg;
}
