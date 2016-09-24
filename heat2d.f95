program heat2d
real::K,jarak_waktu,jarak_x,jarak_y,raw_data(301,11,11),exdata,neuman_fix
integer::looping,i,j,l,tot_waktu,tot_x,tot_y

10 format (f13.7)
!13 format (11(f8.5, 2x)) for testing output
13 format (3(i2, 2x), f13.7)
!open input file at first
	open(12, file = 'data2d.dat')
!open output file
	open(11, file = 'prediksi2d.dat')

!act for prepare initial condition
	do i = 1, 11
		do j = 1, 11
			read(12,10)exdata
			raw_data(1,i,j) = exdata
		end do
	end do


!declare all constant we need, just change var in here if u need different condition
	K = 2.3 / 10**(5) !K = 2.3 x 10^5 meter^2 / second
	jarak_waktu = 1 !range time in our grid
	jarak_x = 0.1 !our grid for x y axis
	jarak_y = 0.1
	neuman_fix = 0.0 !our boundary condition
	tot_waktu = 301 !our grid condition
	tot_x = 11
	tot_y = 11

!REAL ACTION FOR COMPUTING
	do i = 2, tot_waktu !raw_data(1,j) is for initial condition
		do j = 1, tot_y
			do l = 1, tot_x
				if ((l .eq. 1) .OR. (l .eq. tot_x)) then
					dif_x = neuman_fix
				else
					dif_x = (raw_data(i-1,j,l+1) - 2*raw_data(i-1,j,l) + raw_data(i-1,j,l-1)) / jarak_x**2.0
				end if
				if ((j .eq. 1) .OR. (j .eq. tot_y)) then
					dif_y = neuman_fix
				else
					dif_y = (raw_data(i-1,j+1,l) - 2*raw_data(i-1,j,l) + raw_data(i-1,j-1,l)) / jarak_y**2.0
					write(*,*)raw_data(i-1,j+1,l),raw_data(i-1,j,l),raw_data(i-1,j-1,l),dif_y
				end if
				raw_data(i,j,l) = raw_data(i-1,j,l) + K * jarak_waktu * (dif_x + dif_y)
			end do
		end do
	end do

	!do i = 1, 61
	!	write(*,13)raw_data(i,1),raw_data(i,2),raw_data(i,3),raw_data(i,4),raw_data(i,5),raw_data(i,6),raw_data(i,7) &
	!	,raw_data(i,8),raw_data(i,9),raw_data(i,10),raw_data(i,11)
	!end do
	
	write(11,*)'#format'
	write(11,*)'#waktu x y suhu'
	do i = 1, tot_waktu
		do j = 1, tot_y
			do l = 1, tot_x
				write(11,13)i-1, j-1, l-1, raw_data(i,j,l)
			end do
		end do
		write(11,*)
		write(11,*)
	end do

end
