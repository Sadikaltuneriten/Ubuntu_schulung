cat << 'EOF' > setup_game.sh
#!/bin/bash
# Spiel-Setup: Die Suche nach dem Geheimnis

BASE="Terminal_Challenge"
mkdir -p $BASE
cd $BASE

# 15+ verschachtelte Ordner mit wirren Namen erstellen
mkdir -p a/b/c/d/e/geheimnis/f/g/h
mkdir -p x/y/z/ordner1/ordner2/ziel
mkdir -p 1/2/3/4/5/6/7/8/9/treffer
mkdir -p omega/alpha/beta/gamma/delta

# Überall "Müll-Dateien" verteilen
for d in $(find . -type d); do
    echo "Hier ist nur Staub..." > "$d/staub.txt"
    echo "Suche weiter!" > "$d/hinweis.txt"
done

# Die versteckte Zieldatei anlegen (mit einem Punkt am Anfang)
# Nur grep kann den Inhalt finden!
SECRET_DIR="1/2/3/4/5/6/7/8/9/treffer"
echo "HERZLICHEN GLUECKWUNSCH! Das Passwort lautet: SAMBA_PRO_2026" > "$SECRET_DIR/.geheimnis.txt"

echo "Setup abgeschlossen! Der Ordner 'Terminal_Challenge' wurde erstellt."
EOF

chmod +x setup_game.sh
./setup_game.sh
