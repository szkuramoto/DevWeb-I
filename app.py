from flask import Flask, render_template

app = Flask(__name__)

@app.route("/quemsomos")
def quemsomos():
    return render_template("quemsomos.html")


@app.route("/contato")
def contato():
    return render_template("contato.html")

@app.route("/home")
def home():
    return render_template("index.html")