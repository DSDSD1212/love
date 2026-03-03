import http.server
import socketserver
import json
import base64
import os

PORT = 8000
DIRECTORY = "/home/sds/my_test/love/love"
os.chdir(DIRECTORY)

class Handler(http.server.SimpleHTTPRequestHandler):
    def do_POST(self):
        if self.path == '/upload':
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            try:
                data = json.loads(post_data.decode('utf-8'))
                filename = data['filename']
                image_data = data['image'].split(',')[1]
                
                with open(os.path.join(DIRECTORY, "assets", "images", filename), "wb") as fh:
                    fh.write(base64.b64decode(image_data))
                
                self.send_response(200)
                self.end_headers()
                self.wfile.write(b'Success')
            except Exception as e:
                self.send_response(500)
                self.end_headers()
                self.wfile.write(str(e).encode())
        else:
            self.send_response(404)
            self.end_headers()

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Serving at port {PORT}")
    httpd.serve_forever()
