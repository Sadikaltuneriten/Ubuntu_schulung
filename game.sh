cat << 'EOF' > setup_game_v2.sh
#!/bin/bash
BASE="Terminal_Challenge"
rm -rf $BASE
mkdir -p $BASE
cd $BASE

# 20 Ordner mit wirren Pfaden erstellen
paths=(
  "alpha/beta/gamma/delta"
  "system/logs/backup/old"
  "users/admin/documents/private"
  "var/tmp/cache/sessions"
  "mnt/external/drive/data"
  "1/2/3/4/5/6/7/8/9"
)

for p in "${paths[@]}"; do
    mkdir -p "$p"
    # Erstelle in jedem Ordner 3-5 Dummy-Dateien mit Zufallsnamen
    for i in {1..4}; do
        echo "Nichts zu sehen in Datei $i..." > "$p/file_$RANDOM.txt"
    done
done

# Die ECHTE Zieldatei an einem fiesen Ort verstecken
# Der Dateiname verrät NICHTS!
TARGET_DIR="1/2/3/4/5/6/7/8/9"
echo "HERZLICHEN GLUECKWUNSCH! Das Passwort für Samba lautet: KURS_ERFOLG_2026" > "$TARGET_DIR/info_$(date +%s).txt"

# Ein paar falsche Fährten (Fallen) einbauen
echo "Das ist eine Falle! Suche weiter nach dem echten 'Passwort'." > "system/logs/backup/old/note.txt"

echo "--------------------------------------------------"
echo "Setup fertig! Die Challenge ist im Ordner: $BASE"
echo "Aufgabe: Findet das Wort 'Passwort' im INHALT aller Dateien."
echo "--------------------------------------------------"
EOF

chmod +x setup_game_v2.sh
./setup_game_v2.sh
