# Code by Farrel Augusta Dinata

ulangiMenu=y
while [ $ulangiMenu == "y" ]; do
    echo "====================================================="
    echo "-- Selamat datang di menu serbaguna komputer anda --"
    echo "-----------------------------------------------------"
    echo "Silakan pilih salah satu menu berikut"
    echo "  1. Lihat path direktori saat ini"
    echo "  2. Membuat folder baru"
    echo "-----------------------------------------------------"
    read -p " >>> " pilihan

    case $pilihan in
        1)
            pwd
            ;;
        2)
            read -p "Masukkan nama folder baru: " namaFolder
            if mkdir $namaFolder; then
                echo "Folder $namaFolder berhasil dibuat."
            else
                echo "Gagal membuat folder $namaFolder. Folder mungkin sudah ada."
            fi
            ;;
        3)
            echo "Pilihan 3 belum tersedia."
            ;;
        *)
            echo "Pilihan tidak valid."
            ;;
    esac

        echo "-----------------------------------------------------"
    read -p "Ingin kembali ke menu? (y/n): " ulangiMenu
done
