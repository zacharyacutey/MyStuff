from replace import replace
rules = {}
for i in 'abcdefghijklmnopqrstuvwxyz':
  rules[i]=i
#SPECIAL CHARACTERS DEFINITIONS
ALT_A='\x1ba'
#END SECTION
rules[ALT_A]=u"\u0250"
