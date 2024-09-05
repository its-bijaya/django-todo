FROM python:3.8

WORKDIR /home/app

COPY requirement.txt .

RUN python3 -m venv myenv && \
    . myenv/bin/activate && \
    pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["myenv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]

