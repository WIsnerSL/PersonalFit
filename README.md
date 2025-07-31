💪 Personal Fit
App Flutter para exibir e contratar personal trainers, com simulação de preço e contato via WhatsApp.

✅ Funcionalidades
Listagem de personal trainers

Detalhes com bio, nota e preço

Simulação de contratação (modalidade e frequência)

Envio de interesse (POST)

Abertura do WhatsApp via link

🔌 Backend (JSON Server)
Instale o JSON Server:
bash
Copiar
Editar
npm install -g json-server
Rode o backend local:
bash
Copiar
Editar
json-server --watch db.json --port 3000
Verifique se o arquivo db.json está na raiz do projeto.

▶️ Rodando o App
Pré-requisitos:
Flutter instalado

Emulador Android ou dispositivo

Passos:
bash
Copiar
Editar
git clone https://github.com/WIsnerSL/PersonalFit.git
cd PersonalFit
flutter pub get
flutter run