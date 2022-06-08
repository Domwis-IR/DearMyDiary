import numpy as np
import pandas as pd
import re
import json
from konlpy.tag import Okt
import tensorflow as tf
from keras.preprocessing.sequence import pad_sequences
from keras.preprocessing.text import Tokenizer
from keras import models
from keras import layers

def preprocessing(review, okt, remove_stopwords = False, stop_words =[]):

    review_text = re.sub('[^가-힣ㄱ-ㅎㅏ-ㅣ\\s]','',review)

    #2. okt 객체를 활용하여 형태소 단어로 나눔
    word_review = okt.morphs(review_text,stem=True)

    if remove_stopwords:
        #3. 불용어 제거(선택)
        word_review = [token for token in word_review if not token in stop_words]
    return word_review

def vectorize_sequences(sequences, dimension=10000):
    results = np.zeros((len(sequences), dimension))
    for i, sequence in enumerate(sequences):
        results[i, sequence] = 1.
    return results

def create_model():
  model = models.Sequential()
  model.add(layers.Dense(64, activation='relu', input_shape=(10000,)))
  model.add(layers.Dense(64, activation='relu'))
  model.add(layers.Dense(6, activation='softmax'))
  
  model.compile(optimizer='rmsprop',
              loss='categorical_crossentropy',
              metrics=['accuracy'])

  return model

def test_preprocessing(input_text):
    tokenizer = Tokenizer()
    stop_words = ['은','는','이','가','를','을','하','아','것','들','의','있','되','수','보','주','등','한']
    okt = Okt()
    clean_inf_review = []

    clean_inf_review.append(preprocessing(input_text,okt,remove_stopwords=True,stop_words= stop_words))
    inf_sequences = tokenizer.texts_to_sequences(clean_inf_review)

    word_vocab = tokenizer.word_index #단어사전형태
    MAX_SEQUENCE_LENGTH = 10 #문장 최대 길이

    inputs = pad_sequences(inf_sequences,maxlen=MAX_SEQUENCE_LENGTH,padding='post').tolist()
    inputvec = vectorize_sequences(inputs)

    return inputvec


def sentiment_classfier(inputvec):
    model = create_model()
    path = "C:\Users\RyuJihae\OneDrive - 경희대학교\4학년 1학기\서비스 데이터 사이언스\코드\Depression_Diagnosis\models"
    latest =  tf.train.latest_checkpoint(path)
    model.load_weights(latest)
    predictions = model.predict(inputvec)
    result =predictions[0].copy()
    for i, elem in enumerate(result):
        result[i] = elem*100
    result= result.astype(int)
    return result