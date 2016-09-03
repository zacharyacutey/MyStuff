Ans->Z
If Z=0
Then
"0"->Str0
Else
1->J
If Z<0
Then
_Z->Z
_1->J
End
{0,1}->L1
{Z,Z}->L2
{1,1}->L3
LinReg(ax+b) L1,L2,L3,Y1
Equ>String(Y1,Str0)
sub(Str0,4,int(log(Z)+1))->Str0
If J=_1
"_"+Str0->Str0
End
