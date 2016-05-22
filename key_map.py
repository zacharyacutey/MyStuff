from replace import replace
rules = {}
for i in 'abcdefghijklmnopqrstuvwxyz':
  rules[i]=i
rules['3']='\xc9\x9c'
rules['E']='\xc9\x9b'
rules['R']='\xca\x80'
rules['T']='\xce\xb8'
