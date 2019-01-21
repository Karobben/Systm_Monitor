
import os, time
from bs4 import BeautifulSoup
from urllib.request import urlopen
import pyfiglet
from pyparsing import *


Bar_sub={'0':' ','1':"\u2581",'2':"\u2582",'3':"\u2583",'4':"\u2584",'5':"\u2585",'6':"\u2586",'7':"\u2587",'8':"\u2588"}

def Col_bar2(N_real,N_max,N_bar=6,Clo_B1=32,Clo_B2=44,Clo_Tr=0.7,Clo_C1=92,Clo_C2=44):
  if int(N_real) >= int(N_max):
    N_real = N_max
  N_rate = round(float(N_real)/float(N_max),2)
  if int(N_real) != int(N_max):
    if int(N_real)/int(N_max) < Clo_Tr:
      Clo_B1=Clo_B1
    else:
      Clo_B1 = Clo_C1
      Clo_B2 = Clo_C2
    # B_head
    if int(N_rate*N_bar) == float(N_rate*N_bar):
      B_head = " \n"*(int((1-N_rate)*(N_bar-1)))
    else:
      B_head = " \n"*(int((1-N_rate)*(N_bar)))
    N_mid = str(round(float(N_rate*N_bar),2)).split(".")[1]
    N_mid = str(int(float("0."+N_mid)*8))
    # B_mid
    B_mid = "\x1b["+str(Clo_B1)+";"+str(Clo_B2)+";6m"+Bar_sub[N_mid]+"\x1b[0m\n"
    #B_head = B_head.replace("\n\n",'')
    #B_tail
    B_tail = ("\x1b["+str(Clo_B1)+";104;6m\u2588\x1b[0m\n")*int(N_rate*N_bar)
    # Bar
    if len(B_tail.split('\n')) > N_bar:
      B_mid = ''
    Bar = B_head +B_mid +B_tail +"\n"
    Bar = Bar.replace('\n\n','')
  else:
    Bar  = "\x1b[91;104;6m\u2588\x1b[0m"+"\n\x1b[91;104;6m\u2588\x1b[0m"*(N_bar-1)
  return Bar
  #for test
  #result =''
  #for i in range(len(Bar.split('\n'))):
  #  result +=Bar.split('\n')[i]+str(i+1)+'\n'
  #return result

def Easy_Com(A_l,A_r,N_blank=2):
  result = ''
  Ll = len(A_l.split('\n'))
  Lr = len(A_r.split('\n'))
  for i in range(Ll):
    if i > (Lr-1):
      AR = len_UC(A_r.split('\n')[0])*"-"
    else:
      AR = A_r.split('\n')[i]
    result += A_l.split('\n')[i] +N_blank*" " +AR + "\n"
  result += "\n======="
  return result.replace("\n\n=======",'')

def len_UC(String):
  ESC = Literal('\x1b')
  integer = Word(nums)
  escapeSeq = Combine(ESC + '[' + Optional(delimitedList(integer,';')) +
                  oneOf(list(alphas)))
  nonAnsiString = lambda s : Suppress(escapeSeq).transformString(s)
  unColorString = nonAnsiString(String)
  return(len(unColorString))
#########

'''
Bar_Char part 1 start
'''
Number_Bar = 40
for i in range(1,Number_Bar+1):
  globals()['Bar'+str(i)+"_n"]=0
'''
Bar_Char part 1 stop
'''

'''
Bar_Char part 2 start
'''
#Net_dwn = float(Net_dw.split("/"))
Bar1_n =Net_dwn
# find the max
for i in reversed(range(2,Number_Bar+1)):
  globals()['Bar'+str(i)+"_n"] = globals()['Bar'+str(i-1)+"_n"]
Bar_list = []
for i in range(1,Number_Bar+1):
  Bar_list += [globals()['Bar'+str(i)+"_n"]]
Bar_list.sort()
Bar_nmax = int(Bar_list[-1]+1)
#"Bar"+str(i)+" =Col_bar2(Bar"+str(i)+"_n,Bar_nmax,6,32,32)"
for i in range(1,Number_Bar+1):
  globals()['Bar'+str(i)] = Col_bar2(globals()['Bar'+str(i)+"_n"],Bar_nmax,6,34,34,0.9,31,42)
Bar_chart = Bar1
#for  i  in range(len(Bar1.split('\n'))):
for i in range(2,Number_Bar+1):
  Bar_chart = Easy_Com(Bar_chart,globals()['Bar'+str(i)],0)
'''
Bar_Char part 2 stop
'''

for i in range(2000):
  Bar_chart = run(i)
  os.system('clear')
  print(Bar_chart)
  time.sleep(0.05)
