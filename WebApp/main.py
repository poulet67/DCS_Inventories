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

import os
import sys
import uvicorn
from fastapi import FastAPI, Request
from fastapi.responses import FileResponse, JSONResponse
from fastapi.staticfiles import StaticFiles
#from fastapi.templating import Jinja2Templates

app = FastAPI()
#dirname = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__))))
#templates = Jinja2Templates(directory="templates")

os.chdir(sys.path[0])

@app.get("/")
async def index():   
    return FileResponse("./static/index.html")

#@app.get("/bootstrap.js")
#async def index():   
#    return FileResponse("./static/js/bootstrap.js")

@app.get("/outside_inventory")
async def index():   
    return JSONResponse("./data/inventories_init_JSON.json")

#@app.get("/bootstrap.css")
#async def index():   
#    return FileResponse("./static/css/bootstrap.css")

@app.get("/main.js")
async def get_inventory():   
    return FileResponse("./static/js/main.js")

@app.post("/_Dispatch_")
async def dispatch():   
#do some stuff
    return 0
   
if __name__ == '__main__':
    uvicorn.run(app, port=8000)