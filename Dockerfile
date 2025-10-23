FROM python:3.12
RUN uv init
WORKDIR /work
COPY . /work/
RUN uv add
EXPOSE 8000
CMD [ "uv","run","uvicorn","main:app","--host","0.0.0.0","--reload" ]