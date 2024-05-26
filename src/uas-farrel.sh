# Code by Farrel Augusta Dinata

ulangiMenu=y
while [ $ulangiMenu == "y" ]; do
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
    echo "  6. Give me a motivation!"
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
        4)
            echo "Masukkan catatan (Ctrl + D to exit)"
            echo "----------------------------------------------------"
            cat - > myNotes.txt
            echo "----------------------------------------------------"
            if [ $? -eq 0 ]; then
                echo "Catatan berhasil dibuat!"
            else 
                echo "Error: catatan gagal dibuat!"
            fi
            ;;
        5)
            read -p "Masukkan file yang ingin dibaca: " fileDicari
            cat $fileDicari
            ;;
        6)
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
            ;;
        *)
            echo "Pilihan tidak valid."
            ;;
    esac

    echo -e "\n----------------------------------------------------"
    read -ep $'\033[0;32mIngin kembali ke menu? (y/n): \033[0m' ulangiMenu
    clear
done