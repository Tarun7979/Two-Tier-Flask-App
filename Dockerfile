FROM python:3.9-slim
WORKDIR /app
RUN dnf install -y gcc mariadb-connector-c-devel pkgconf-pkg-config && \
    dnf clean all
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]