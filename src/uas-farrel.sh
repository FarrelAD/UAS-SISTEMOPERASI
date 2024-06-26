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
    echo "  6. GitHub repository log"
    echo "  7. Kalkulator"
    echo "  8. System monitoring"
    echo "  9. TIMER!"
    echo "  10. Give me a motivation!"
    echo "  11. ^CUSTOM COMMAND^"
    echo "----------------------------------------------------"
}

make_dir() {
    read -p "Masukkan nama folder baru: " namaFolder
    if mkdir ../sample/$namaFolder; then
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

show_git_log() {
    echo "===================================================="
    # Alamat direktori disimpan di dalam sebuah variabel
    parentClonedGithubRepoPath=""
    if [ ! -d "$parentClonedGithubRepoPath" ]; then
        echo "Masukkan alamat parent kloningan repositori GitHub: "
        read parentClonedGithubRepoPath
    fi
    
    echo "Kloningan repositori yang anda miliki: "
    # Cek apakah subdirektori dari parent adalah kloningan github repository
    # Kemudian akan dicetak
    for dir in "$parentClonedGithubRepoPath"/*/ ; do
        if [ -d "$dir/.git" ]; then
            echo -e "\033[1;37;43m $(basename "$dir") \033[0m"
        fi
    done

    echo "----------------------------------------------------"
    read -p "Pilih direktori: " selectedDirectory
    # Melakukan pengecekan tracking git commit yang telah dilakukan
    git --git-dir="$parentClonedGithubRepoPath/$selectedDirectory/.git" log --oneline
    echo "----------------------------------------------------"
    read -p "Simpan pesan commit (y/n)? " isWantToSaveCommitLog
    # Menyimpan hasil dari git log ke dalam sebuah file
    if [[ "$isWantToSaveCommitLog" == "y"  ||  "$isWantToSaveCommitLog" == "Y" ]]; then
        read -p "Nama file: " fileGitlogName
        git --git-dir="$parentClonedGithubRepoPath/$selectedDirectory/.git" log --oneline > ../sample/gitlog/$fileGitlogName
        if [ $? -eq 0  ]; then
            echo "Git commit log telah berhasil dibuat!"
        else
            echo "Git commit log gagal dibuat!"
        fi
    fi
}

calculator() {
    echo "===================================================="
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

run_timer() {
    read -p "Set timer (detik): " timerSecondSet
    read -p "Pesan timer ketika selesai: " timerMessage

    start_timer() {
        sleep $timerSecondSet
        echo -e "\n=======================TIMER========================"
        echo -e "\033[0;33m$timerMessage\033[0m"
        echo "===================================================="
    }

    start_timer &
    echo "Timer dimulai selama $timerSecondSet detik. PID: $!"
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


create_custom_command() {
    shopt -s expand_aliases

    read -p "Masukkan command yang ingin digunakan: " usedCommand
    read -p "Masukkan alias: " aliasCommand
    echo "----------------------------------------------------"

    # Menambahkan custom command ke ~/.bashrc agar ketika program berhenti
    # Custom command tetap bisa dijalankan
    echo "alias $aliasCommand='$usedCommand'" >> ~/.bashrc
    source ~/.bashrc
    
    # Mengecek apakah alias sudah benar-benar dibuat
    if grep -q "^alias $aliasCommand='$usedCommand'" ~/.bashrc; then
        echo "Custom command telah sukses dibuat!"
    else
        echo "Custom command gagal dibuat"
    fi
}

show_custom_command() {
    echo "Berikut adalah custom command yang telah anda buat:"
    grep "^alias" ~/.bashrc
}

delete_custom_command() {
    read -p "Masukkan command yang ingin dihapus: " deletedCommand
    read -p "Masukkan alias yang ingin dihapus: " deletedAlias
    echo "----------------------------------------------------"
    
    if grep -q "^alias $deletedAlias='$deletedCommand'" ~/.bashrc; then
        # Menghapus custom command yang telah dibuat
        sed -i "/^alias $deletedAlias='$deletedCommand'/d" ~/.bashrc
        echo "Alias '$deletedAlias' untuk command '$deletedCommand' telah dihapus ~/.bashrc."
    else
        echo "Alias '$deletedAlias' untuk command '$deletedCommand' tidak ditemukan di  ~/.bashrc."
    fi

    source ~/.bashrc
}

custom_command() {
    echo "===================================================="
    echo "  1. Buat custom command"
    echo "  2. Lihat custom command yang telah dibuat"
    echo "  3. Hapus custom command"
    read -p " >>> " pilhan
    echo "----------------------------------------------------"

    case $pilhan in
        1)
            create_custom_command
            ;;
        2)
            show_custom_command
            ;;
        3)
            delete_custom_command
            ;;
        *)
            echo "Pilihan tidak valid."
            ;;
    esac
}

ulangiMenu=y
while [ $ulangiMenu == "y" ]; do
    show_menu
    read -p " >>> " pilihan
    clear

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
            show_git_log
            ;;
        7)
            calculator
            ;;
        8)
            htop
            ;;
        9)
            run_timer
            ;;
        10)
            give_motivation
            ;;
        11)
            custom_command
            ;;
        *)
            echo "Pilihan tidak valid."
            ;;
    esac

    echo -e "\n----------------------------------------------------"
    read -ep $'\033[0;32mIngin kembali ke menu? (y/n): \033[0m' ulangiMenu
    clear
done