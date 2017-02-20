#!/usr/bin/python

# 	this is a script for computing movement of block on the 
#	frictionless floor

import numpy as np
import math

#initial condition (t=0)
k = 1.0			#constant of spring N/m
m = 1.0			#mass of block
v = 0.0			#speed of block is m/s
x = 1.0			#position of block m
A = 9.0			#amplitudo of spring m
t = 0.0			#init time
loop = 10		#how many loop we want to compute

tmstep = math.pi / loop
omega = np.sqrt(k / m)

#function we need
#fpos = lambda time,vel:A * np.cos(omega * time + vel)	#function of position
fx = lambda time,vel: -1 * omega**2.0 * x				#function of diferential
fungpos = lambda kecp,paspos: paspos + kecp * tmstep

#init container
energy = np.zeros((loop + 1), dtype = float)
kec = np.zeros((loop + 1), dtype = float)
posx = np.zeros((loop + 1), dtype = float)

energy[0] = 0.5 * k * x + 0.5 * m * v**2.0	#energy at t=0, it mean when block at rest
kec[0] = v									#speed at t=0 is the intial condition
posx[0] = x									#position at t=0 is the initial condition

#runge kutta 4th order
def runkut (time, var):
	k1 = tmstep * fx(time, var)
	k2 = tmstep * fx(time + tmstep/2.0, var + k1/2.0)
	k3 = tmstep * fx(time + tmstep/2.0, var + k2/2.0)
	k4 = tmstep * fx(time + tmstep, var + k3)
	return var + 1/6.0 * (k1 + 2*k2 + 2*k3 + k4)

print "speed at timestep", t, "is", v
for i in range(0,loop):
	v = runkut(t,v)
	t += tmstep
	kec[i+1] = v
	x = fungpos(v, x)
	posx[i+1] = x
	energy[i+1] = 0.5 * k * posx[i+1] + 0.5 * m * v**2.0
	print "speed at timestep", t, "is", v
print energy
