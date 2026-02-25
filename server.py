from http.server import HTTPServer, BaseHTTPRequestHandler
import sqlite3

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html; charset=utf-8')
        self.end_headers()
        
        # Datenbank auslesen
        conn = sqlite3.connect('kunden.db')
        cursor = conn.execute("SELECT name, zeit FROM besucher ORDER BY zeit DESC")
        rows = cursor.fetchall()
        conn.close()

        # HTML zusammenbauen
        html = "<html><body><h1>📡 Datenbank-Monitor (VM 2)</h1><ul>"
        for row in rows:
            html += f"<li><b>{row[0]}</b> - Eingetragen am: {row[1]}</li>"
        html += "</ul><p><small>Aktualisiere die Seite nach einem Eintrag von VM 1.</small></p></body></html>"
        
        self.wfile.write(html.encode())

print("Server läuft auf Port 8080...")
HTTPServer(('0.0.0.0', 8080), SimpleHandler).serve_forever()
