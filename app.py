from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Salam, Devops Komandasi!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
print("Hello Jenkins server for testing webhook!")
