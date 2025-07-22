FROM php:8.2-cli

WORKDIR /app

COPY . /app

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid 10014 \
    choreo

RUN chown -R choreo:choreo /app

USER 10014

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080"]
