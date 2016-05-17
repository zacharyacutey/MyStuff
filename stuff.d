bool s(int[]a,int v){int[]t;int i,j;while(i!=a.length)t~=a[i++]%v;while(j!=a.length)if(t[j++]!=0)return 0;return 1;}
int g(int[]a){int r=a[0];int i;while(i!=a.length){r=r>a[i]?a[i]:r;i++;}return r;}
bool is_reduce(int[]a){int i=2;while(i<=a.g)if(s(a,i++))return 0;return 1;}
void main(){}
