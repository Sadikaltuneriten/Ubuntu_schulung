cat << 'EOF' > setup_game_final.sh
#!/bin/bash
BASE="Terminal_Challenge"
rm -rf $BASE
mkdir -p $BASE/belohnung
cd $BASE

# 1. Die Belohnung vorbereiten (Eine Datei, die sie entpacken sollen)
echo "BRAVO! Du hast den Kurs gerockt. Hier ist dein digitales Zertifikat: [SAMBA-MASTER-2026]" > belohnung/erfolg.txt

# 2. Die ZIP-Datei mit Passwort erstellen (Passwort: SAMBA_PRO_26)
# Wir nutzen 'zip', falls nicht installiert: sudo apt install zip -y
zip -r -P "SAMBA_PRO_26" geheimnis.zip belohnung/
rm -rf belohnung/  # Das Original löschen, damit sie entpacken MÜSSEN

# 3. Verschachtelte Ordner für die Suche erstellen
paths=("sys/kernel/debug" "home/user/hidden" "var/mail/inbox")
for p in "${paths[@]}"; do
    mkdir -p "$p"
    echo "Hier ist nichts..." > "$p/file_$RANDOM.txt"
done

# 4. Der HINWEIS-Befehl (Schritt 1 der Suche)
# Sie müssen nach "ENTPACKEN" suchen, um den Befehl zu finden
echo "Nutze diesen Befehl zum entpacken: unzip geheimnis.zip" > "sys/kernel/debug/hinweis.txt"

# 5. Das PASSWORT (Schritt 2 der Suche)
# Sie müssen nach "PASSWORT" suchen
echo "Das Passwort lautet: SAMBA_PRO_26" > "home/user/hidden/.pass.txt"

echo "--------------------------------------------------------"
echo "DIE CHALLENGE STARTET JETZT!"
echo "1. Findet den Befehl zum Entpacken (Suche nach 'ENTPACKEN')"
echo "2. Findet das Passwort (Suche nach 'PASSWORT')"
echo "3. Entpackt die Datei 'geheimnis.zip' im Hauptordner."
echo "--------------------------------------------------------"
EOF

chmod +x setup_game_final.sh
./setup_game_final.sh
