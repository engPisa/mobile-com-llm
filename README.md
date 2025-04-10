# Mobile com LLM

Este projeto consiste em um aplicativo desenvolvido em Flutter que se comunica com um Modelo de Linguagem Grande (LLM), como o Gemini, utilizando prompts personalizados de acordo com o tema escolhido.

## ⚠️ Aviso Importante

> ⚠️ **Atenção:** o backend utilizado neste projeto está hospedado em uma instância gratuita.  
> Sua instância será desligada automaticamente após um período de inatividade, o que pode causar **atrasos de até 50 segundos ou mais** no tempo de resposta quando for ativada novamente.

## 📲 Baixe o APK

Você pode testar o aplicativo em seu dispositivo Android baixando o APK diretamente pelo link abaixo:

👉 [Clique aqui para baixar o APK](https://drive.google.com/drive/folders/19uwu4qui367loFbGUGs1UV-WXwIvWHVW?usp=sharing)

## Funcionalidades

- **Interação com LLM**: Permite que os usuários enviem dúvidas ou dificuldades e recebam conselhos ou respostas geradas pelo modelo de linguagem.
- **Interface Intuitiva**: Interface amigável que facilita a interação do usuário com o aplicativo.
- **Compatibilidade Multiplataforma**: Projetado para funcionar em diversas plataformas, incluindo Android, iOS, Web, Windows, macOS e Linux.

## Tecnologias Utilizadas

- **Flutter**: Framework principal para o desenvolvimento do aplicativo.
- **Dart**: Linguagem de programação utilizada.
- **flutter_markdown**: Para renderização de respostas em Markdown.
- **API de LLM**: Integração com modelos de linguagem como o Gemini para processamento de linguagem natural.

## Estrutura do Projeto

A estrutura do projeto é organizada da seguinte forma:

```bash
mobile-com-llm/ 
            ├── lib/ # Código fonte principal do aplicativo  
            │    ├── main.dart # Ponto de entrada do aplicativo
            │    └── services/ # Serviços como a comunicação com a API          
            │        └── api_service.dart 
            ├── backend # Diretório raiz do backend
            │    ├── app.py # Raiz do backend com a rota
            │    ├── Procfile # Configuração especifica do render
            │    └── requirements.txt # Dependências para rodar o ambiente
            ├── android/ # Código específico para a plataforma Android
            ├── pubspec.yaml # Configurações e dependências do projeto 
            └── README.md # Documentação do projeto
```

## Como Executar o Projeto

1. **Pré-requisitos**:
    - [Flutter](https://docs.flutter.dev/get-started/install) instalado na máquina.
    - Dispositivo ou emulador configurado para a plataforma desejada.

2. **Clonar o Repositório**:
   ```bash
   git clone https://github.com/engPisa/mobile-com-llm.git
   ```
3. **Instalar as Dependências:**:
    ```bash
      flutter pub get
    ```
4. **Executar o Aplicativo:**:
    ```bash
      flutter run
    ```
#   Personalização do Prompt

 > Para personalizar o prompt enviado ao LLM, edite a função getAdvice no arquivo api_service.dart localizado em lib/services/. Por exemplo:

```bash
  final result = await ApiService.getAdvice("Sou um estudante. Minha dúvida é: $mensagem");
```
- Altere o texto conforme a necessidade para adaptar o comportamento do modelo às suas especificações.

### 🧑‍💻 Autor
Cesar Pisa - Desenvolvedor em evolução 🚀
   
