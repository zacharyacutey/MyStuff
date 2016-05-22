from replace import replace
rules = {}
for i in 'abcdefghijklmnopqrstuvwxyz':
  rules[i]=i
rules['3']='\xc9\x9c'
rules['E']='\xc9\x9b'
rules['R']='\xca\x80'
rules['T']='\xce\xb8'
rules['Y']='\xca\x8f'
rules['U']='\xca\x8a'
rules['I']='\xc9\xaa'
rules['O']='\xc9\x94'
