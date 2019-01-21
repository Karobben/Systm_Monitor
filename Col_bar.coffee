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
    #B_tail += "\n______tailtag"
    #B_tail = B_tail.replace("\n\n______tailtag",'')
    # Bar
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

#return B_head,B_mid,B_tail

#print(Col_bar2(2,6,6))
#print(Col_bar2(3700,4000,6),len(Col_bar2(3999,4000,6).split('\n')))
#print(Col_bar2(74,100,12)[0],"-")
import time
import os


for i in range(20,201):
  os.system("clear")
  BAR  = Col_bar2(i,200,6,32,32,0.6,31,42)
  print(BAR,i)
  print(len(BAR.split('\n')))
  if len(BAR.split('\n')) != 6:
    break
  time.sleep(0.1)
