
# 💪 Personal Fit

Aplicativo Flutter desenvolvido como desafio técnico para exibir um catálogo de personal trainers, com funcionalidades de filtro, simulação de contratação e contato via WhatsApp.

---

## 🚀 Como rodar o projeto

### 1. Pré-requisitos

- [Flutter 3.x](https://flutter.dev/docs/get-started/install)
- [Node.js](https://nodejs.org/) com `npm`
- Emulador Android ou dispositivo físico

### 2. Clonar o repositório

```bash
git clone https://github.com/WIsnerSL/PersonalFit.git
cd PersonalFit
```

### 3. Instalar dependências Flutter

```bash
flutter pub get
```

### 4. Executar o app

```bash
flutter run
```

---

## 🔌 Como rodar o JSON Server (Mock API)

### 1. Instalar `json-server` globalmente (se ainda não tiver)

```bash
npm install -g json-server
```

### 2. Rodar o servidor com o arquivo `db.json`

```bash
json-server --watch db.json --port 3000
```

> O JSON Server rodará localmente em `http://localhost:3000`

---

## 🧱 Arquitetura do Projeto

O projeto segue a estrutura modular por domínio:

```
lib/
├── core/
├── modules/
│   └── personals/
│       ├── data/
│       │   ├── datasources/     -> Comunicação com a API (Remote)
│       │   ├── models/          -> Modelos que representam os dados externos
│       │   └── repositories/    -> Implementações de repositórios
│       ├── domain/
│       │   ├── entities/        -> Entidades principais (ex: Personal)
│       │   └── repositories/    -> Contratos (abstrações)
│       └── presentation/
│           ├── controllers/     -> Lógica de estado e interação
│           └── pages/           -> Telas da aplicação
```

- ✅ **Separação de responsabilidades**
- ✅ **Fácil manutenção**
- ✅ **Aderente à Clean Architecture (simplificada)**

---

## 📱 Funcionalidades

### 1. 📋 Catálogo de Personais
- Listagem de personal trainers
- Filtros (nome e especialidades — a implementar)

### 2. 📄 Detalhes do Personal
- Foto, bio, preço, especialidades, avaliação e contato

### 3. 📊 Simulação de Contratação
- Escolha de modalidade e frequência
- Cálculo estimado do valor
- Envio do interesse para a API

### 4. 💬 Contato via WhatsApp
- Link direto para abrir o WhatsApp:  
  `https://wa.me/55<whatsapp_number>`

---

## 🌐 Mock API

O projeto utiliza `json-server` como API fake:

- `GET /personals` → Lista de personal trainers
- `POST /contactInterest` → Envia interesse de contratação

📎 Link local da API: [`http://localhost:3000`](http://localhost:3000)

---

## 🧪 Testado com:

- ✅ Flutter 3.22.1
- ✅ Android SDK API 33
- ✅ json-server 0.17+

---

## 👨‍💻 Autor

Desenvolvido por [WIsnerSL](https://github.com/WIsnerSL) — desafio técnico Flutter 💙
