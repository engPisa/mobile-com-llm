from flask import Flask, request, jsonify
from flask_cors import CORS
from dotenv import load_dotenv
import requests
import os

load_dotenv()

app = Flask(__name__)

CORS(app)

API_KEY = os.getenv("GEMINI_API_KEY")
URL_API = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?"

@app.route('/get_advice', methods=['POST'])
def make_communication():
  """
    POST /get_advice

    📚 Descrição:
    Esta rota recebe um prompt (mensagem de texto) enviado pelo cliente Flutter e 
    retorna uma resposta gerada pelo modelo Gemini da API do Google AI.

    ✅ Corpo da requisição (JSON):
    {
        "message": "Texto com o pedido ou pergunta para o modelo"
    }

    🔁 Resposta de sucesso (status 200):
    {
        "reply": "Texto gerado pelo modelo Gemini"
    }

    ❌ Resposta de erro (status 500):
    {
        "error": "Erro ao gerar resposta"
    }

    🧠 Observação:
    - É necessário definir a variável de ambiente GEMINI_API_KEY com a chave de API válida.
    - O modelo utilizado é o gemini-2.0-flash e a chamada é feita para o endpoint:
      https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key{api_key}

    📦 Usos:
    - Dicas de estudo
    - Planejamento de metas
    - Recomendações temáticas com base no app
  """
  data = request.get_json()
  prompt = data.get("message", "")

  response = requests.post(
    f"{URL_API}key={API_KEY}",
    headers={"Content-Type": "application/json"},
    json={
      "contents":[
        {
          "parts":[{"text": prompt}]
        }
      ]
    }
  )
  if response.status_code == 200: # ok
    reply = response.json()['candidates'][0]['content']['parts'][0]['text']
    return jsonify({
      "reply": reply
    })
  else:
      error_data = response.json()["error"]
      return jsonify({
        "error": "Erro ao gerar resposta",
        "message": error_data["message"]
      }),error_data["code"] # http_status_code
