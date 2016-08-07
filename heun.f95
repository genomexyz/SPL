program heun
real::nilai_x,nilai_y,kumpulan_x(500),kumpulan_y(500),nilai(500),kemiringan(2),jarak
integer::counter
integer::looping


!fungsi untuk prediktor
predik(y_awal, y_akhir, delta_x) = y_awal + delta_x * y_akhir
!fungsi untuk yi
hasil(y0, f0, f1, delta_x) = y0 + (f0 + f1) * jarak / 2.0
!fungsi persamaan turunan
f(x, y) = 0.5 * (x - y)

!deklarasi awal
counter = 2
jarak = 0.5
batas = 2.5

!input nilai awal
write(*,*)'masukkan nilai x0 dan y0!'
read(*,*)nilai_x,nilai_y
kumpulan_y(1) = nilai_y
kumpulan_x(1) = nilai_x

!REAL ACTION
do while (nilai_x .le. batas)
	kemiringan(1) = f(nilai_x, nilai_y)
	y1 = predik(nilai_y, kemiringan(1), jarak)
	kemiringan(2) = f(nilai_x + jarak, y1)
	nilai_y = hasil(nilai_y, kemiringan(1), kemiringan(2), jarak)
	kumpulan_x(counter) = nilai_x + jarak
	kumpulan_y(counter) = nilai_y
	counter = counter + 1
	nilai_x = nilai_x + jarak
end do

write(*,*)'berikut nilai x dan y berdasarkan batas nilai x yang di deklarasikan'
do i = 1, counter-2 !jumlah x dan y yang di generate sejumlah counter-2
	write(*,*)kumpulan_x(i),kumpulan_y(i)
end do

end
