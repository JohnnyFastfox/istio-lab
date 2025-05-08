from flask import Flask, request, jsonify
    import os

    app = Flask(__name__)

    @app.route("/")
    def index():
        version = os.getenv("VERSION", "unknown")
        return jsonify({"message": f"Hello from version {version}"})

    if __name__ == "__main__":
        app.run(host="0.0.0.0", port=80)