/* this is a script for gauss method in system of linear equation
 * 
 */

#include <cmath>
#include <iostream>
#include <fstream>

#define BATASAN_JUMLAH_DATA 4
#define BATAS_KOLOM 5

using namespace std;

void showmat (float data [BATASAN_JUMLAH_DATA][BATAS_KOLOM])
{
	int j;
	int k;

	cout << "keadaan matrix saat ini" << endl;
	for (j = 0; j < 4; j++) {
		for (k = 0; k < 5; k++) {
			cout << data[j][k] << " ";
		}
		cout << endl;
	}
}

void solusi (float mat [BATASAN_JUMLAH_DATA][BATAS_KOLOM], float hasil [BATASAN_JUMLAH_DATA]) //mencari solusi nilai x
{
	float con_pengurang = 0;
	int fase = 0;

	for (int i = 0; i < BATASAN_JUMLAH_DATA; i++) {
		fase++;
		//cout << "fase sekarang : " << fase << endl;
		for (int j = 0; j < fase; j++) {
			if (j == (fase - 1)) {
				hasil[BATASAN_JUMLAH_DATA - fase] = (mat[BATASAN_JUMLAH_DATA - fase][BATAS_KOLOM - 1] - con_pengurang) /
				    mat[BATASAN_JUMLAH_DATA - fase][BATASAN_JUMLAH_DATA - fase];
				//cout << "debug yang di bagi : " << mat[BATASAN_JUMLAH_DATA - fase][BATAS_KOLOM - 1] - con_pengurang << endl;
				//cout << "debug pembagi : " << mat[BATASAN_JUMLAH_DATA - fase][BATASAN_JUMLAH_DATA - fase] << endl;
				con_pengurang = 0;
			} else {
				//cout << "debug core dumped dengan fase " << fase << " dan nilai j " << j << endl;
				con_pengurang += hasil[BATASAN_JUMLAH_DATA - 1 - j] * mat[BATASAN_JUMLAH_DATA - fase][BATASAN_JUMLAH_DATA - 1 - j];
			}
		}
	}
}

void operasi (int urutan, float data [BATASAN_JUMLAH_DATA][BATAS_KOLOM])
{
	int baris = 0;
	int kolom = 0;
	double dikurangi;
	
	baris = baris + urutan + 1;
	kolom = kolom + urutan;
	for (int i = baris; i < BATASAN_JUMLAH_DATA; i++) {
		dikurangi = data [i][kolom];
		for (int j = kolom; j < BATAS_KOLOM; j++)
			data [i][j] = data [i][j] - dikurangi / data [urutan][urutan] * data [urutan][j];
	}
}


int main ()
{
	int i;
	float matrix [BATASAN_JUMLAH_DATA][BATAS_KOLOM];
	float finishing [BATASAN_JUMLAH_DATA] = {0};

	ifstream input("matrix");

	i = 0;
	while (input >> matrix[i][0] >> matrix[i][1] >> matrix[i][2] >> matrix[i][3] >> matrix[i][4]) {
		i++;
		if (i == BATASAN_JUMLAH_DATA) //too lazy to using vector or whatever
			break;
	}
	for (int j = 0; j < 3; j++) {
		operasi(j, matrix);
		showmat(matrix);
	}
	solusi(matrix, finishing);
	for (int i = 0; i < BATASAN_JUMLAH_DATA; i++) {
		cout << "nilai dari x" << i + 1 << " adalah " << finishing[i] << endl;
	}
	return 0;
}
