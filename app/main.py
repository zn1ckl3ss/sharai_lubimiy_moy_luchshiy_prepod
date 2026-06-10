from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI(title="Safe IS Project API")

# Инициализируем сборщик метрик при старте приложения
@app.on_event("startup")
async def startup():
    Instrumentator().instrument(app).expose(app)

@app.get("/")
def read_root():
    return {"status": "ok", "message": "Hello from FastAPI!"}