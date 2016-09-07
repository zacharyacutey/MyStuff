import std.stdio;
/*
A question I have about this kind of sort.
Copyright (C) 2016 Zachary Taylor

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

NOTE: MY LEGAL NAME IS SPELLED WITHOUT THE ACUTE ACCENT
You can contact me @
zacharywithanacuteoverthey@gmail.com
*/
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
