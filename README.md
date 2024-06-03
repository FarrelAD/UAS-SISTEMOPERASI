# Data Diri

| | |
| -- | -- |
| NIM | **2341720081** |
| Nama Lengkap | **Farrel Augusta Dinata** |
| Kelas | TI-1B |
| Dosen Pembimbing 1 | [Erfan Rohadi, ST., M.Eng., Ph.D](https://scholar.google.co.id/citations?user=i9ivLAkAAAAJ&hl=id) |
| Dosen Pembimbing 2 | [Mohammad Faried Rahmat, S.ST., M.Tr.T](https://github.com/fariedrahmat) |

# SISTEM OPERASI
### Fitur Program Shell script

|**No**| **Fitur** | **Detail** |
|--|--|--|
| 1 | Lihat path direktori saat ini | Melihat alamat path direktori yang sedang digunakan saat ini menggunakan perintah `pwd` |
| 2 | Membuat folder baru | Membuat folder baru dengan nama folder sesuai dengan input pengguna. Perintah yang digunakan `mkdir` dan `read` |
| 3 | Mencari sebuah file | Mencari sebuah file di seluruh direktori yang ada dengan perintah `find / -type f -name "$fileDicari" -print -quit 2> /dev/null` |
| 4 | Membuat catatan | Membuat sebuah file dengan menggunakan perintah `cat - > $fileName` |
| 5 | Membaca file | Membaca file yang telah dibuat menggunakan perintah `cat ../sample/notes/$fileToRead` |
| 6 | Git log commit | Melihat log/history git commit dari kloningan repository yang dimiliki dengan menggunakan perintah `git --git-dir="$parentClonedGithubRepoPath/$selectedDirectory/.git" log --oneline`|
| 7 | Operasi kalkulator sederhana | Bisa melakukan operasi penjumlahan, pengurangan, perkalian, dan pembagian. Kode secara umum menggunakan arithmatic expression dengan perintah `result=$(($number1 + $number2))`. Untuk pembagian menggunakan perintah `awk` (`result=$(awk "BEGIN { print $number1 / $number2 }")`) agar hasil yang didapat lebih presisi |
| 8 | System monitoring | Melihat statistik penggunaan komputer seperti memory, CPU, task info, dan masih banyak lagi dengan perintah `htop` |
| 9 | Simple timer | Melakukan hitung mundur yang dilakukan di background proses dengan memanfaatkan perintah berikut: `sleep` dan `&` untuk menjalankan proses di background |