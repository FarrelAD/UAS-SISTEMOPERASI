# Code by Farrel Augusta Dinata

ulangiMenu=y
while [ $ulangiMenu == "y" ]; do
    echo "===================================================="
    echo $'\033[0;32m-- Selamat datang di menu serbaguna komputer anda -- \033[0m'
    echo "----------------------------------------------------"
    echo "Silakan pilih salah satu menu berikut"
    echo "  1. Lihat path direktori saat ini"
    echo "  2. Membuat folder baru"
    echo "----------------------------------------------------"
    read -p " >>> " pilihan

    case $pilihan in
        1)
            pwd
            ;;
        2)
            read -p "Masukkan nama folder baru: " namaFolder
            if mkdir $namaFolder; then
                echo -e "Folder \033[0;33m$namaFolder\033[0m berhasil dibuat."
            else
                echo -e "Gagal membuat folder \033[0;33mT$namaFolder\033[0m. Folder mungkin sudah ada."
            fi
            ;;
        3)
            echo "Pilihan 3 belum tersedia."
            ;;
        *)
            echo "Pilihan tidak valid."
            ;;
    esac

    echo -e "\n----------------------------------------------------"
    read -ep $'\033[0;32mIngin kembali ke menu? (y/n): \033[0m' ulangiMenu
    clear
done