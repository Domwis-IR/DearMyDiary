from flask import Flask,request,jsonify

from Depression_Diagnosis import Sentiment_Classifer, Symptom_Classifer
app = Flask(__name__)



@app.route('/',methods=['POST'])

def analyze_diary():
	data = request.get_json()
	if 'text' not in data:
		return "", 400

	sentiment = Sentiment_Classifer.sentiment_classfier(data)
	symptom = Symptom_Classifer.find_best_Ssymptom(data)

	return [sentiment, symptom], 200


if __name__ == '__main__':

	app.run()
