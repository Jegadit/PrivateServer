FROM python:3.10.0-alpine3.15

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY HiddenLeaf HiddenLeaf

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=5 \
    CMD curl -f http://localhost:5000/status || exit 1

ENTRYPOINT ["python", "./HiddenLeaf/myApp.py"]
