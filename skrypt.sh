#!/bin/bash
if [ ["$1" == "==date"] ]; then
    echo "Dzisiejsza data: $(date)"

if [ ["$1" == "--logs"] ]; then
    for ((i=1; i<=100; i++)); do
        filename="log${i}.txt"
        echo "Nazwa pliku: ${filename}" > "${filename}"
        echo "Nazwa skryptu: skrypt.sh" >> "${filename}"
        echo "Data: $(date)" >> "${filename}"
    done

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

if [[ "$1" == "--help" ]]; then
    echo "Dostępne opcje:"
    echo "  --date: Wyświetla dzisiejszą datę."
    echo "  --logs [liczba]: Tworzy pliki logx.txt, gdzie x to numer pliku od 1 do liczba (domyślnie 100)."
    echo "  --help: Wyświetla dostępne opcje."
else
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
fi