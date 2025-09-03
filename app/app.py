from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from the DevSecOps demo app!"

if __name__ == '__main__':
    # Bind to all interfaces so Docker container works
    app.run(host='0.0.0.0', port=5000)
