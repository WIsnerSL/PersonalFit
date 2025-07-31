# 💪 Personal Fit

Aplicativo Flutter desenvolvido como desafio técnico para exibir um catálogo de personal trainers com funcionalidades de filtro, simulação de contratação e contato via WhatsApp.

---

## 📱 Funcionalidades

### 1. 🔍 Catálogo de Personais
- Listagem de personal trainers
- Exibe: nome, especialidades, cidade, estado e nota de avaliação
- Busca por nome (a implementar)
- Filtro por especialidades (a implementar)

### 2. 📄 Tela de Detalhes
- Foto, nome, localização, especialidades, biografia, preço e nota
- Botão para abrir WhatsApp
- Botão para simulação de contratação

### 3. 📩 Simulação de Contratação
- Escolha de modalidade (Online/Presencial)
- Frequência semanal (1x a 5x por semana)
- Cálculo estimado do valor mensal
- Alerta visual de confirmação

### 4. 💬 Contato via WhatsApp
- Integração com WhatsApp via `url_launcher`
- Abertura direta do app ou navegador via link: `https://wa.me/55<whatsapp_number>`

---

## 🔌 API Mockada

Atualmente os dados são simulados localmente com uma lista estática (`mock`) carregada via repositório.

### Simulado:
- `GET /personals` → lista de personais
- `POST /contact-interest` → simulado com `AlertDialog`

> Futuramente pode ser substituído por API real (como MockAPI.io, JSON Server ou Firebase).

---

## 🚀 Como Rodar Localmente

### Pré-requisitos:
- Flutter 3.x instalado
- Dart 3.8.x
- Emulador ou dispositivo físico

### Passos:

```bash
# Clone o repositório
git clone https://github.com/WIsnerSL/PersonalFit.git
cd PersonalFit

# Instale as dependências
flutter pub get

# Execute o app
flutter run
