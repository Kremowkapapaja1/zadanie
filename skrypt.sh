#!/bin/bash
if [ ["$1" == "==date" || "$1" == "-d"] ]; then
    echo "Dzisiejsza data: $(date)"

if [ ["$1" == "--logs" || "$1" == "-l" ] ]; then
    for ((i=1; i<=100; i++)); do
        filename="log${i}.txt"
        echo "Nazwa pliku: ${filename}" > "${filename}"
        echo "Nazwa skryptu: skrypt.sh" >> "${filename}"
        echo "Data: $(date)" >> "${filename}"
    done
    echo "Utworzono 100logów"
else
    echo "nieznana flaga"

if [[ "$1" =~ ^[0-9]+$ ]]; then
    count="$1"
else
    count=100
fi

for ((i=1; i<=count; i++)); do
    filename="log${i}.txt"
    echo "Nazwa pliku: ${filename}" > "${filename}"
    echo "Nazwa skryptu: skrypt.sh" >> "${filename}"
    echo "Data: $(date)" >> "${filename}"
done

if [[ "$1" == "--help" || "$1" == "-h"]]; then
    echo "Dostępne opcje:"
    echo "  --date lub -d: Wyświetla dzisiejszą datę."
    echo "  --logs [liczba] lub -l [liczba]: Tworzy pliki logx.txt, gdzie x to numer pliku od 1 do liczba (domyślnie 100)."
    echo "  --help lub -h: Wyświetla dostępne opcje."
else
    echo "Nieznana opcja. Użyj --help lub -h, aby zobaczyć dostępne opcje."
fi

if [[ "$1" == "--init" ]]; then
    # Pobierz ścieżkę bieżącego katalogu
    current_dir=$(pwd)
    
    # Klonuj repozytorium
    git clone https://github.com/Kremowkapapaja1/zadanie.git "$current_dir/repozytorium"
    
    # Dodaj ścieżkę do zmiennej środowiskowej PATH
    echo "export PATH=\"\$PATH:$current_dir/repozytorium\"" >> ~/.bashrc
    source ~/.bashrc
    
    echo "Repozytorium zostało sklonowane, a ścieżka została dodana do zmiennej środowiskowej PATH."
else
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
fi