Copyright (C) 2016 Zachary Taylor

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>
There's not a way to comment in TI-Basic I know of, so this line and above are NOT part of the source to be copied into the calculator

Prompt A,B,C
abs(B)->D
1->E
abs(B^2-4*A*C)->F
abs(2*A)->G
G->H
If B^2-4*A*C>0
Then
1->K
Else
_1->K
End
If _B/A>0
Then
1->P
Else
_1->P
End
2->I
While (D>=I) and (G>=I)
While remainder(D,I)+remainder(G,I)=0
D/I->D
G/I->G
End
I+1->I
End
2->I
While (I^2)<=F
While remainder(F,I^2)=0
E*I->E
F/(I^2)->F
End
I+1->I
End
2->I
While (E>=I) and (H>=I)
While remainder(E,I)+remainder(H,I)=0
E/I->E
H/I->H
End
I+1->I
End
prgmDISPLAYQ
Pause Str1
Stop
Disp P*D,"/",G
Pause "+ OR -"
Disp E,"*V(",K*F,")/",H
