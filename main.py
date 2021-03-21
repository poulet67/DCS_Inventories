# Inventories system Web App example
#
# Features:
# - A shop to buy more equipment
# - A dispatch system to send equipment into the game
# - View current dispatch missions
# - 
#
#
#
#
#   Usage:
#
#    $ uvicorn main:app --reload --port 5000
#
#    And then head to http://127.0.0.1:5000/ in your browser to see the map displayed
#
#

import uvicorn
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse, FileResponse, JSONResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

app = FastAPI()

templates = Jinja2Templates(directory="templates")

@app.get("/")
async def index():
    return FileResponse("./static/index.html")
    
if __name__ == '__main__':
    uvicorn.run(app, port=8000)