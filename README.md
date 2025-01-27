# DriveHub

**DriveHub** é um sistema desenvolvido para auxiliar no gerenciamento de autoescolas. Ele oferece funcionalidades essenciais para cadastro, consulta e organização de informações relacionadas a alunos, instrutores, veículos, aulas práticas, financeiro e configurações gerais.

---

## 📋 Funcionalidades

- **Gerenciamento de Alunos**:<br>
  Cadastro e consulta por CPF ou RENACH.<br>
  Exibição detalhada de informações do aluno.<br>
  Cadastro automático caso o aluno não exista no sistema.

- **Gerenciamento de Instrutores e Veículos**:<br>
  Cadastro e controle de instrutores e veículos utilizados.

- **Aulas Práticas**:<br>
  Registro de processos RENACH.<br>
  Consulta de aulas realizadas.<br>
  Geração de relatórios detalhados.

- **Financeiro**:<br>
  Gestão de guias, transferências e relatórios financeiros.

- **Configurações Gerais**:<br>
  Configuração de dados da empresa.<br>
  Gerenciamento de usuários do sistema.

---

## 🛠️ Tecnologias Utilizadas

- **Frontend**:<br>
  **HTML5**: Estrutura do projeto.<br>
  **CSS3**: Estilização e design responsivo.<br>
  **JavaScript (ES6+)**: Dinamismo e interatividade.<br>
  **Tailwind Framework**: Mais estilos de design.

- **Backend**:<br>
  **Node.js**: Ambiente de execução JavaScript.<br>
  **PostgreSQL 13+**: Banco de dados utilizado para armazenar informações.<br>

  **Mobile**:<br>
  **Flutter**: Desenvolvimento tanto para Android quanto IOS.<br>

- **Bibliotecas Externas**:<br>
[Moment.js](https://momentjs.com/): Manipulação de datas.<br>
[Express](https://expressjs.com/): Criação de servidores Web no BackEnd.<br>
[Body-Parser](https://www.npmjs.com/package/body-parser): Middleware para processar o corpo das requisições HTTP.<br>
[CORS](https://www.npmjs.com/package/cors): Middleware para habilitar CORS em aplicações Express.<br>
[JSON Web Token](https://jwt.io/): Criação e verificação de tokens JWT.<br>
[Node-Notifier](https://www.npmjs.com/package/node-notifier): Notificações nativas no desktop.<br>
[pg](https://www.npmjs.com/package/pg): Integração com o banco de dados PostgreSQL.


---

## 📁 Estrutura do Projeto

A organização do projeto segue o padrão MVC (Model-View-Controller):

DriveHub/ 
<br>├── assets/ # Recursos de mídia (imagens, ícones, etc.) 
<br>├── CSS/ # Arquivos de estilo 
<br>├── Cadastros/ # Páginas de cadastro (alunos, instrutores, veículos, etc.) 
<br>├── AulasP/ # Páginas relacionadas às aulas práticas 
<br>├── Exames/ # Páginas relacionadas aos exames 
<br>├── Financeiro/ # Páginas de controle financeiro 
<br>├── Config/ # Configurações gerais do sistema 
<br>├── Suporte/ # Página de suporte 
<br>├── index.html # Página inicial 
<br>├── JS/ # Scripts JavaScript
<br>├── server.js # Arquivo principal do servidor Node.js 
<br>└── utils/ # Utilitários, como conexão com o banco de dados

---

## ⚙️ Configuração do Projeto

### Pré-requisitos

1. **Node.js** instalado em sua máquina.<br>
2. **PostgreSQL 13** configurado para o banco de dados.<br>
3. Navegador moderno (Google Chrome, Firefox, Edge, etc.).

### Instalação e Execução

1. **Clone o repositório**:<br>
   ```bash
   git clone https://github.com/seu-usuario/DriveHub.git
🎨 Design e Estilo
O design do DriveHub foi projetado para ser simples, intuitivo e responsivo:

Sidebar de Navegação:<br> Menu lateral com submenus dinâmicos para facilitar o acesso às funcionalidades.

Painel de Consulta:<br> Interface amigável para busca de informações, com mensagens de erro claras.

Responsividade:<br> Adaptado para dispositivos móveis e desktops.

🌐 API Endpoints<br>
Consulta de Aluno<br>
URL: POST /buscar-aluno<br>
Body:<br>
json<br>

{<br>
    "cpf": "12345678900",<br>
    "renach": "RENACH12345"<br>
}<br>

{<br>
    "success": true,<br>
    "aluno": {<br>
        "nome_aluno": "João Silva",<br>
        "cpf_aluno": "123.456.789-00",<br>
        "renach": "RENACH12345"<br>
    }<br>
}<br>
📞 Contato<br>
Lucas Gabriel Amorim Steffen<br> 📱 +55 (66) 9 9904-5963

🤝 Contribuições<br>
Contribuições são bem-vindas!