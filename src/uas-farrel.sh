# Code by Farrel Augusta Dinata

ulangiMenu=y
while [ $ulangiMenu == "y" ]; do
    echo "===================================================="
    echo $'\033[0;32m-- Selamat datang di menu serbaguna komputer anda -- \033[0m'
    echo "----------------------------------------------------"
    echo "Silakan pilih salah satu menu berikut"
    echo "  1. Lihat path direktori saat ini"
    echo "  2. Membuat folder baru"
    echo "  3. Cari sebuah file"
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
            read -p "Masukkan nama file yang ingin dicari: " fileDicari
            filePath=$(find / -type f -name "$fileDicari" -print -quit 2> /dev/null)
            if [ -n "$filePath" ]; then
                echo -e "\n\033[0;32mFile ditemukan !\033[0m"
                echo "$filePath"
            else
                echo -e "\033[0;32mFile tidak dapat ditemukan !\033[0m"
            fi
            ;;
        *)
            echo "Pilihan tidak valid."
            ;;
    esac

    echo -e "\n----------------------------------------------------"
    read -ep $'\033[0;32mIngin kembali ke menu? (y/n): \033[0m' ulangiMenu
    clear
done