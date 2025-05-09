# Basis-Image: schlankes Python-Laufzeit-Environment
FROM python:3.10-slim
# Arbeitsverzeichnis im Container
WORKDIR /app
# Abhängigkeiten ins Image kopieren und installieren
COPY ./src/requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
COPY ./src /app/
# Anwendungscode ins Image kopieren
# Netzwerkport 5000 dokumentieren (optional)
EXPOSE 80
# Container-Startbefehl: Flask-App ausführen
RUN adduser -D appuser
USER appuser

CMD ["python", "app.py"]
