#!/usr/bin/python

#trivial code ever !!!
#generate number

#silahkan di edit
inputxakhir = 142
inputyakhir = 6
inputxawal = 95
inputyawal = -11
#end

batasx = inputxakhir+1
batasy = inputyakhir+1

for i in range(inputyawal,batasy):
	for t in range(0,2):
		faktory = t/2.0
		if (t == 1) and ((batasy-1) == i):
			break
		for j in range(inputxawal,batasx):
			for k in range(0,2):
				faktorx = k/2.0
				if (k == 1 and batasx-1 == j):
					break
				print (j+faktorx),(i+faktory)


