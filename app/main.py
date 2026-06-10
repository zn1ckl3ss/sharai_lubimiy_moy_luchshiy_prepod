from fastapi import FastAPI

app = FastAPI(title="Safe IS Project API")


@app.get("/")
def read_root():
    return {"status": "ok", "message": "Hello from FastAPI!"}