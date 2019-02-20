import sys,re

inbuffer=sys.stdin.read()
inbuffer=re.sub(r'[ \t\r\n]*\n[ \t]*',r'\n',inbuffer)
inbuffer=re.sub(r'[ \t\r\n]*,[ \t\r\n]',r',',inbuffer)
inbuffer=re.sub(r'\n#[^\n]+','',inbuffer)
inbuffer=re.sub(r'\r\n', r'\n',inbuffer)
inbuffer=re.sub(r'\r', r'\n',inbuffer)
sys.stdout.write(inbuffer)

