from fastapi import FastAPI
from transformers import pipeline

# create a new fastapi app instance
app = FastAPI()

# initalize the text generation pipeline
pipe = pipeline("text2text-generation", model="google/flan-t5-small")

@app.get("/")
def home():
    return {"Message":"Hello world"}

# Define a function to handle the GET request at '/generate'

@app.get("/generate")
def generate(text:str):
    ## use the pipeline to generate text from given input text
    output = pipe(text)

    ## return the generate text in json response
    return {"output":output[0]['generated_text']} 