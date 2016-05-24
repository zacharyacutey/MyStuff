bool is_reduce(int[] arr,int arg)
{
  int i;
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
