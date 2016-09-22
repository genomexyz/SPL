program heat
real::K,jarak_waktu,jarak_x,raw_data(61,11),exdata
integer::looping
10 format (f5.2)
!13 format (11(f8.5, 2x)) for testing output
13 format (i2, 2x, i2, 2x, f13.7)
!open input file at first
	open(12, file = 'datasuhu.dat')
!open output file
	open(11, file = 'prediksi.dat')

		do i = 1, 10
			read(12,10)exdata
			raw_data(1,i) = exdata
		end do


!declare all constant we need
	K = 2.3 / 10**(5) !K = 2.3 x 10^5 meter^2 / second
	jarak_waktu = 1 !range time in our grid is 1 second
	jarak_x = 1 !our grid for x axis

	do i = 2, 61 !raw_data(1,j) is for initial condition
		raw_data(i,1) = 0
		raw_data(i,11) = 0
		do j = 2, 10 !due to boundary condition, all boundary in both side value is 0
			raw_data(i,j) = raw_data(i-1, j) + K * jarak_waktu * (raw_data(i-1, j+1) - 2*raw_data(i-1, j) + raw_data(i-1, j-1)) / jarak_x**2
		end do
	end do

	!do i = 1, 61
	!	write(*,13)raw_data(i,1),raw_data(i,2),raw_data(i,3),raw_data(i,4),raw_data(i,5),raw_data(i,6),raw_data(i,7) &
	!	,raw_data(i,8),raw_data(i,9),raw_data(i,10),raw_data(i,11)
	!end do
	
	write(11,*)'#format'
	write(11,*)'#x waktu suhu'
	do i = 1, 61
		do j = 1, 11
			write(11,13)i-1, j-1, raw_data(i,j)
		end do
	end do

end
