from flask import Flask, make_response
import os

app = Flask(__name__)


@app.route("/")
def hello():
    number = 1
    if not os.path.exists('./counter'):
        os.mkdir('./counter')

    if not os.path.exists('./counter/number.txt'):
        with open('./counter/number.txt', 'w'): pass
    if os.path.isfile("./counter/number.txt"):
        with open("./counter/number.txt", "r") as file:
            number = file.readline()
            if not number: number = 1

    number = int(number) + 1

    with open("./counter/number.txt", "w") as file:
        file.writelines(f"{number}")

    response = make_response(f"{number}", 200)
    response.mimetype = "text/plain"
    return response


if __name__ == "__main__":
    app.run(host="0.0.0.0")
