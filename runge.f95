program runge
real::nilai_x,nilai_y,kumpulan_x(500),kumpulan_y(500),nilai(500),konstanta(3),jarak
integer::counter

!format penulisan
	17 format (1x, '|', f8.5, 1x, '|', f8.5, 1x, '|')

!fungsi persamaan turunan
f(x, y) = 0.5 * (x - y)

!deklarasi awal
counter = 2 !WAJIB, JANGAN DI UBAH
jarak = 0.5
batas = 2.5

!input nilai awal
write(*,*)'masukkan nilai x0 dan y0!'
read(*,*)nilai_x,nilai_y
kumpulan_y(1) = nilai_y
kumpulan_x(1) = nilai_x

!REAL ACTION
do while (nilai_x .le. batas)!(nilai_x .le. batas)
	konstanta(1) = jarak * f(nilai_x, nilai_y) !k1
	konstanta(2) = jarak * f(nilai_x + 0.5 * jarak, nilai_y + 0.5 * konstanta(1)) !k2
	konstanta(3) = jarak * f(nilai_x + jarak, nilai_y - konstanta(1) + 2 * konstanta(2)) !k3
	write(*,*)'proses...'
	write(*,*)konstanta(1),konstanta(2),konstanta(3)
	nilai_y = nilai_y + (konstanta(1) + 4.0 * konstanta(2) + konstanta(3)) / 6.0
	nilai_x = nilai_x + jarak
	kumpulan_y(counter) = nilai_y
	kumpulan_x(counter) = nilai_x
	counter = counter + 1
end do

!output session
write(*,*)'berikut nilai x dan y berdasarkan batas nilai x yang di deklarasikan'
write(*,*)
write(*,*)'---------------------'
write(*,*)'| nilai x | nilai y |'
write(*,*)'---------------------'
do i = 1, counter-2 !jumlah x dan y yang di generate sejumlah counter-2
	write(*,17)kumpulan_x(i),kumpulan_y(i)
end do
write(*,*)'---------------------'
write(*,*)

end
