# post_server.py - POST 요청 처리
from aiohttp import web


async def handle_post(request):
    data = await request.json()
    name = data.get("name", "Guest")
    return web.json_response({"greeting": f"Hello, {name}!"})


app = web.Application()
app.router.add_post("/greet", handle_post)

if __name__ == "__main__":
    web.run_app(app, host="127.0.0.1", port=8080)
