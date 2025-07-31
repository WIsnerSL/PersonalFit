# 💪 PERSONAL FIT

Aplicativo Flutter desenvolvido como desafio técnico para exibir um catálogo de personal trainers com funcionalidades de filtro, simulação de contratação e contato via WhatsApp.

---

## 🚀 COMO RODAR O PROJETO

### 1. Instale as dependências:
```bash
flutter pub get
<<<<<<< HEAD
flutter run
=======
```

### 2. Inicie o mock server (JSON Server):
```bash
npm install -g json-server
json-server --watch db.json --port 3000
```

> O servidor será iniciado em: [`http://localhost:3000`](http://localhost:3000)

### 3. Execute o app:
```bash
flutter run
```

---

## 🧱 ARQUITETURA DO PROJETO

O projeto segue o padrão **Clean Architecture**, dividido em:

- `data/`: Models, datasources e implementações
- `domain/`: Entidades e contratos dos repositórios
- `presentation/`: Páginas e controllers
- `core/`: Constantes e utilitários globais (se necessário)

---

## 📱 FUNCIONALIDADES

### 1. 📋 Catálogo de Personais
- Listagem de personal trainers
- Exibe: nome, especialidades, cidade, estado e nota de avaliação
- 🔍 Busca por nome _(a implementar)_
- 🧩 Filtro por especialidades _(a implementar)_

### 2. 🧾 Tela de Detalhes
- Foto, nome, localização, especialidades, biografia, preço e nota
- Botão para abrir WhatsApp
- Botão para simulação de contratação

### 3. 📊 Simulação de Contratação
- Escolha de modalidade (`Online` ou `Presencial`)
- Frequência semanal (`1x` a `5x`)
- Cálculo estimado do valor mensal
- Alerta visual de confirmação

### 4. 💬 Contato via WhatsApp
- Integração com WhatsApp via `url_launcher`
- Abertura direta pelo link:
```text
https://wa.me/55<whatsapp_number>
```

---

## 🔗 MOCK API

O projeto utiliza `json-server` como API fake:

- `GET /personals` → Lista de personais
- `POST /contactInterest` → Envia interesse

> Link local da API: [`http://localhost:3000`](http://localhost:3000)

---


>>>>>>> 5ef4e25 (Versão final)
