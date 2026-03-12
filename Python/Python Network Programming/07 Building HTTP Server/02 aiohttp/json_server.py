# json_server.py - JSON 응답
from aiohttp import web


async def handle_get(request):
    return web.json_response({"status": "ok", "message": "aiohttp server"})


app = web.Application()
app.router.add_get("/", handle_get)

if __name__ == "__main__":
    web.run_app(app, host="127.0.0.1", port=8080)
