import std.stdio;

// Any idea what this sort is?
int[] dec(int[] array)
{
    int i = 0;
    int[] res;
    while(i != array.length)
    {
        res ~= array[i] - 1;
        i++;
    }
    return res;
}
int[] zero_indexes(int[] array)
{
    int i = 0;
    int[] res;
    while(i != array.length)
    {
        if(array[i] == 0)
        {
            res ~= i;
        }
        i++;
    }
    return res;
}
bool is_final(int[] arr)
{
    int i = 0;
    while(i!=arr.length)
    {
        if(arr[i]>=0)
        {
            return false;
        }
        i++;
    }
    return true;
}
int[] by_index(int[] va,int[] id)
{
    int i = 0;
    int[] res;
    while(i != id.length)
    {
        res ~= va[id[i]];
        i++;
    }
    return res;
}
int[] sort(int[] array)
{
    int[] copy = array.dup;
    int[] indexes;
    while(!is_final(copy))
    {
        indexes ~= zero_indexes(copy);
        copy = dec(copy);
    }
    return by_index(array,indexes);
}
void main()
{
    writeln(sort([3,6,2,8,0,3]));
}
