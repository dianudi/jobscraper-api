FROM python:3.12-alpine

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir gunicorn
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python3", "-m", "gunicorn", "-w", "1", "-b", "0.0.0.0:5000", "app:create_app()"]