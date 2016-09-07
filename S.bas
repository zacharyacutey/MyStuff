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
I don't think you can comment in TI-BASIC. So, anything at or above this line is NOT part of the source to be entered into the calculator!

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
