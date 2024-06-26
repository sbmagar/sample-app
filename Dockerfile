ARG PYTHON_VERSION=3.11.6
FROM python:${PYTHON_VERSION}-alpine

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

WORKDIR /app

# ARG UID=10001
# RUN adduser \
#     --disabled-password \
#     --gecos "" \
#     --home "/nonexistent" \
#     --shell "/sbin/nologin" \
#     --no-create-home \
#     --uid "${UID}" \
#     appuser

# RUN --mount=type=cache,target=/root/.cache/pip \
#     --mount=type=bind,source=requirements.txt,target=requirements.txt \
#     python -m pip install -r requirements.txt

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

# USER appuser

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
