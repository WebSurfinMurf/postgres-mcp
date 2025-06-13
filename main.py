from fastapi import FastAPI, Request
import psycopg2
import os

app = FastAPI()

def get_conn():
    return psycopg2.connect(
        dbname=os.getenv("MCP_DB_NAME"),
        user=os.getenv("MCP_DB_USER"),
        password=os.getenv("MCP_DB_PASS"),
        host=os.getenv("MCP_DB_HOST")
    )

@app.post("/run_query")
async def run_query(req: Request):
    data = await req.json()
    sql = data.get("query", "").strip().rstrip(";")
    conn = get_conn()
    cur = conn.cursor()
    try:
        cur.execute(sql)
        return {"results": cur.fetchall()}
    except Exception as e:
        return {"error": str(e)}
    finally:
        cur.close()
        conn.close()
