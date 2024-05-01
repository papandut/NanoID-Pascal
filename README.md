# NanoID Pascal
NanoID Pascal adalah generator ID unik yang dibuat dalam bahasa pascal, dimana implementasi dari [NanoID](https://github.com/ai/nanoid) yang ditulis oleh [AI](https://github.com/ai/nanoid)

* Ukuran yang kecil
* Ringan dan Cepat sekitar 0.01 detik yang dibutuhkan untuk menggenerate sebuah unik ID
* Aman, menggunakan Safe Random Generator dimana kemungkinan terjadi tabrakan /  unik id yang sama 1%, 21 Simbol sd 36 simbol
* Bisa digunakan saat Designtime atau Runtime

## Persyaratan
* Free Pascal 3.2.2 ( saya menggunakan versi ini ) , untuk versi ke bawah belum di coba tapi saya rasa bisa bekerja dengan baik
* Lazarus 3.2 ( saya menggunakan versi ini ) , untuk versi ke bawah belum di coba tapi saya rasa bisa bekerja
* Delphi ( perlu sedikit usaha agar bisa berjalan di delphi )

## Instalasi
### Download / Unduh
Download terlebih dahulu atau close Repositori NanoID Pascal

````Git
git clone https://github.com/papandut/NanoID-Pascal.git
````

Disarankan menggunakan cara **`clone`** ini dibandingkan dengan download manual. Jika nanti ada update atau perubahan, Anda cukup melakukan **`pull`** saja

````Git
 git reset --hard HEAD
 git pull
````
### Pengguna Lazarus
Jika anda menggunakan Lazarus, proses instalasi nya lakukan langkah berikut ini
* Buka file **`nanoid_pascal.lpk`**
* Kemudian pada Package nanoID_pascal klik tombol **`compile`**
