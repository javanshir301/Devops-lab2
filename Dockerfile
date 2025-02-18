# Python 3.9 bazasında bir image istifadə edirik
FROM python:3.9

# İş qovluğunu təyin edirik
WORKDIR /app

# Lazımi faylları konteynerə kopyalayırıq
COPY . .

# Python dependency-lərini yükləyirik
RUN pip install --no-cache-dir -r requirements.txt

# Tətbiqi işə salırıq
CMD ["python", "app.py"]

