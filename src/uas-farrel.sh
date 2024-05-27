# Code by Farrel Augusta Dinata

show_menu() {
    echo "===================================================="
    echo "               --[ Jam : $(date +%T) ]--         "
    echo $'\033[0;32m-- Selamat datang di menu serbaguna komputer anda -- \033[0m'
    echo "----------------------------------------------------"
    echo "Silakan pilih salah satu menu berikut"
    echo "  1. Lihat path direktori saat ini"
    echo "  2. Membuat folder baru"
    echo "  3. Cari sebuah file"
    echo "  4. Buat catatan"
    echo "  5. Baca file"
    echo "  6. Kalkulator"
    echo "  7. Give me a motivation!"
    echo "----------------------------------------------------"
}

make_dir() {
    read -p "Masukkan nama folder baru: " namaFolder
    if mkdir $namaFolder; then
        echo -e "Folder \033[0;33m$namaFolder\033[0m berhasil dibuat."
    else
        echo -e "Gagal membuat folder \033[0;33mT$namaFolder\033[0m. Folder mungkin sudah ada."
    fi
}

search_file() {
    read -p "Masukkan nama file yang ingin dicari: " fileToSearch
    filePath=$(find / -type f -name "$fileToSearch" -print -quit 2> /dev/null)
    if [ -n "$filePath" ]; then
        echo -e "\n\033[0;32mFile ditemukan !\033[0m"
        echo "$filePath"
    else
        echo -e "\033[0;32mFile tidak dapat ditemukan !\033[0m"
    fi
}

make_note() {
    read -p "Masukkan nama file: " fileName
    echo "Masukkan catatan (Ctrl + D to exit)"
    echo "----------------------------------------------------"
    cat - > ../sample/notes/$fileName
    echo "----------------------------------------------------"
    if [ $? -eq 0 ]; then
        echo "Catatan berhasil dibuat!"
    else 
        echo "Error: catatan gagal dibuat!"
    fi
}

read_file() {
    echo "Daftar file catatan yang sudah dibuat:"
    ls ../sample/notes > ls_output.txt

    while IFS= read -r line; do
        echo -e "\e[33m$line\e[0m"
    done < ls_output.txt
    echo ""

    read -p "Masukkan catatan yang ingin dibaca: " fileToRead
    echo ""
    cat ../sample/notes/$fileToRead
    rm ls_output.txt
}

calculator() {
    echo -e "\n===================================================="
    echo "Pilih opsi menu"
    echo "----------------------------------------------------"
    echo "  1. Penjumlahan"
    echo "  2. Pengurangan"
    echo "  3. Perkalian"
    echo "  4. Pembagian"
    read -p " >>> " pilihan

    read -p "Masukkan bilangan pertama: " number1
    read -p "Masukkan bilangan kedua: " number2

    unset result
    case $pilihan in
        1)
            result=$(($number1 + $number2))
            ;;
        2)
            result=$(($number1 - $number2))
            ;;
        3)
            result=$(($number1 * $number2))
            ;;
        4)
            result=$(awk "BEGIN { print $number1 / $number2 }")
            ;;  
        *)
            echo "Pilihan tidak valid!"
            ;;
    esac
    echo -e "Hasilnya: \033[0;33m$result\033[0m"
}

give_motivation() {
    allQuotes=("Don’t compare yourself with anyone in this world. If you do so, you are insulting yourself. - Bill Gates" "Invention requires a long-term willingness to be misunderstood. - Jeff Bezos" "Persistence is very important. You should not give up unless you are forced to give up. - Elon Musk" "The only way to do great work is to love what you do. - Steve Wozniak" "The way to do really big things seems to be to start with deceptively small things.  - Paul Graham")

    currentSecond=$(date +%S)
    secondModulo5=$((currentSecond % 5))
    case $secondModulo5 in
        0)
            echo -e "\n\033[0;33m${allQuotes[0]}\033[0m"
            ;;
        1)
            echo -e "\n\033[0;33m${allQuotes[1]}\033[0m"
            ;;
        2)
            echo -e "\n\033[0;33m${allQuotes[2]}\033[0m"
            ;;
        3)
            echo -e "\n\033[0;33m${allQuotes[3]}\033[0m"
            ;; 
        4)
            echo -e "\n\033[0;33m${allQuotes[4]}\033[0m"
            ;;
    esac
}


ulangiMenu=y
while [ $ulangiMenu == "y" ]; do
    show_menu
    read -p " >>> " pilihan

    case $pilihan in
        1)
            pwd
            ;;
        2)
            make_dir
            ;;
        3)
            search_file
            ;;
        4)
            make_note
            ;;
        5)
            read_file
            ;;
        6)
            calculator
            ;;
        7)
            give_motivation
            ;;
        *)
            echo "Pilihan tidak valid."
            ;;
    esac

    echo -e "\n----------------------------------------------------"
    read -ep $'\033[0;32mIngin kembali ke menu? (y/n): \033[0m' ulangiMenu
    clear
done