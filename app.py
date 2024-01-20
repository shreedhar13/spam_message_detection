import streamlit as st 
import pickle
import string
from nltk.corpus import stopwords
import nltk
from nltk.stem.porter import PorterStemmer
nltk.download('punkt')
nltk.download('stopwords')


tfidf = pickle.load(open('vectorizer.pkl','rb'))
model = pickle.load(open('model.pkl','rb'))

ps=PorterStemmer()

def transform_text(text):
    text=text.lower()             #lowercasing
    text=nltk.word_tokenize(text) #tokenizing
    y=[]
    for i in text:
        if i.isalnum():           #removing special character
            y.append(i)
    text=y.copy()  #deep copy,,u can use either y[:] to copy all elements
    y.clear()
    
    for i in text:                #removing stopwords and punctuation
        if i not in stopwords.words('english') and i not in string.punctuation:
            y.append(i)
            
    text=y[:]
    y.clear()
    
    for i in text:       #stemming
        y.append(ps.stem(i))
        
    return " ".join(y)

st.title("EMAIL/SPAM CLASSIFIER")

input_sms=st.text_input('Enter the message')

if st.button('Predict'):
    #1.preprocess i/p text
    transformed_sms = transform_text(input_sms)#return the message which is string
    #2.vectorize
    vector_ip = tfidf.transform([transformed_sms])#passing string in the form of lisr
    #3.predict
    result = model.predict(vector_ip)[0]
    #4.display o/p

    if result == 1:
        st.header("SPAM")
    else:
        st.header("NOT-SPAM")
