

import os, time

Bar_sub={'0':' ','1':"\u2581",'2':"\u2582",'3':"\u2583",'4':"\u2584",'5':"\u2585",'6':"\u2586",'7':"\u2587",'8':"\u2588"}

def Net_get():
    CMD1 = "ifconfig | grep  'TX packets'| tail -n 1| awk '{print $5}'"
    CMD2 = "ifconfig | grep  'RX packets'| tail -n 1| awk '{print $5}'"
    Net_up1 = int(os.popen(CMD1).read().replace('\n',''))
    Net_dw1 = int(os.popen(CMD2).read().replace('\n',''))
    time.sleep(0.5)
    Net_up2 = int(os.popen(CMD1).read().replace('\n',''))
    Net_dw2 = int(os.popen(CMD2).read().replace('\n',''))
    Net_up = (Net_up2 - Net_up1)*2/1024
    Net_dw = (Net_dw2 - Net_dw1)*2/1024
    Net_dwn = Net_dw
    U = "/KB"
    if Net_up > 1024:
      Net_up = Net_up/1024
      U = "/M"
    Net_up = str(round(Net_up,2))+U
    U = "/KB"
    if Net_dw > 1024:
      U = "/KB"
      Net_dw = Net_dw/1024
      U = "/M"
    Net_dw = str(round(Net_dw,2))+U
    return Net_up,Net_dw,Net_dwn

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


Bar1_n =Bar2_n =Bar3_n =Bar4_n =Bar5_n =Bar6_n =Bar7_n =Bar8_n =Bar9_n =Bar10_n =Bar11_n =Bar12_n =Bar13_n =Bar14_n =Bar15_n =Bar16_n =Bar17_n =Bar18_n =Bar19_n =Bar20_n =0
#Bar_chart = ""
#for  i  in range(len(BB.split('\n'))):
#  Bar_chart += Bar1.split('\n')[i]+ Bar2.split('\n')[i]+ Bar3.split('\n')[i]+ Bar4.split('\n')[i]+ Bar5.split('\n')[i]+"\n"
# print(Bar_chart)

#while 1 == 1:
for Net_dwn in range(1,1000):
  #Net_up,Net_dw,Net_dwn = Net_get()
  #Net_dwn = float(Net_dw.split("/"))
  Bar20_n = Bar19_n
  Bar19_n = Bar18_n
  Bar18_n = Bar17_n
  Bar17_n = Bar16_n
  Bar16_n = Bar15_n
  Bar15_n = Bar14_n
  Bar14_n = Bar13_n
  Bar13_n = Bar12_n
  Bar12_n = Bar11_n
  Bar11_n = Bar10_n
  Bar10_n = Bar9_n
  Bar9_n = Bar8_n
  Bar8_n = Bar7_n
  Bar7_n = Bar6_n
  Bar6_n = Bar5_n
  Bar5_n = Bar4_n
  Bar4_n = Bar3_n
  Bar3_n = Bar2_n
  Bar2_n = Bar1_n
  Bar1_n =Net_dwn
  Bar_list = [Bar1_n ,Bar2_n ,Bar3_n ,Bar4_n ,Bar5_n ,Bar6_n ,Bar7_n ,Bar8_n ,Bar9_n ,Bar10_n]
  Bar_list.sort()
  Bar_nmax = (Bar_list[-1]+20)
  #"Bar"+str(i)+" =Col_bar2(Bar"+str(i)+"_n,Bar_nmax,6,32,32)"
  Bar1 =Col_bar2(Bar1_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar2 =Col_bar2(Bar2_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar3 =Col_bar2(Bar3_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar4 =Col_bar2(Bar4_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar5 =Col_bar2(Bar5_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar6 =Col_bar2(Bar6_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar7 =Col_bar2(Bar7_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar8 =Col_bar2(Bar8_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar9 =Col_bar2(Bar9_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar10 =Col_bar2(Bar10_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar11 =Col_bar2(Bar11_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar12 =Col_bar2(Bar12_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar13 =Col_bar2(Bar13_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar14 =Col_bar2(Bar14_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar15 =Col_bar2(Bar15_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar16 =Col_bar2(Bar16_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar17 =Col_bar2(Bar17_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar18 =Col_bar2(Bar18_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar19 =Col_bar2(Bar19_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar20 =Col_bar2(Bar20_n,Bar_nmax,6,34,34,0.6,31,42)
  Bar_chart = ""
  for  i  in range(len(Bar1.split('\n'))):
    Bar_chart += Bar1.split('\n')[i]+ Bar2.split('\n')[i]+ Bar3.split('\n')[i]+ Bar4.split('\n')[i]+ Bar5.split('\n')[i]+ Bar6.split('\n')[i]+ Bar7.split('\n')[i]+ Bar8.split('\n')[i]+ Bar9.split('\n')[i]+ Bar10.split('\n')[i]+ Bar11.split('\n')[i]+ Bar12.split('\n')[i]+ Bar13.split('\n')[i]+ Bar14.split('\n')[i]+ Bar15.split('\n')[i]+ Bar16.split('\n')[i]+ Bar17.split('\n')[i]+ Bar18.split('\n')[i]+ Bar19.split('\n')[i]+ Bar20.split('\n')[i]+"\n"
  os.system('clear')
  print(Bar_chart,Net_dwn)
  #time.sleep(0.1)
'''
AA=''
for i in range(1,21):
  AA += "Bar" +str(i) + "_n ="

for i in reversed(range(2,21)):
  print("Bar"+str(i)+"_n = Bar"+str(i-1)+"_n")

for i in range(1,21):
  print("Bar"+str(i)+" =Col_bar2(Bar"+str(i)+"_n,Bar_nmax,6,34,34,0.6,31,42)")

Bar_chart
AA=''
for  i in range(1,21):
  AA += "Bar"+str(i)+".split('\n')[i]+ "
'''





def test(i,A,B,C,D):
  D=C
  C=B
  B=A
  A=i
  return A,B,C,D
