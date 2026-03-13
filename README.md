# 🛒 Automação E2E - E-commerce DemoBlaze

Este repositório contém um projeto de automação de testes End-to-End (E2E) para o site [DemoBlaze](https://www.demoblaze.com/). O objetivo principal é validar o fluxo completo de jornada de compra de um usuário,
garantindo a qualidade da aplicação desde o cadastro até a confirmação do pedido.

## 🎯 Cenário de Teste Automatizado

O script automatiza o seguinte fluxo de negócio:
1. Criação de um novo usuário com dados dinâmicos.
2. Login com as credenciais recém-criadas no mesmo fluxo.
3. Inclusão de múltiplos produtos no carrinho (Samsung galaxy s6 e Nexus 6).
4. Preenchimento do formulário de *Checkout* com dados fictícios gerados em tempo de execução.
5. Validação do alerta de sucesso nativo do navegador.
6. Validação do modal de confirmação da compra e retorno à página inicial.

## 🛠️ Tecnologias Utilizadas

- **[Python](https://www.python.org/)**: Linguagem de programação base.
- **[Robot Framework](https://robotframework.org/)**: Framework de automação com abordagem *Keyword-Driven* e sintaxe BDD (Behavior-Driven Development).
- **SeleniumLibrary**: Biblioteca para interação com os elementos web do navegador.
- **FakerLibrary**: Utilizada para geração de massa de dados dinâmicos e únicos a cada execução (nomes, senhas, cartões de crédito, etc.), evitando falhas por dados duplicados no banco.

## 📂 Arquitetura do Projeto

O projeto foi estruturado visando boas práticas de organização, manutenção e reaproveitamento de código, inspirado no padrão **Page Object Model (POM)**:


```text
/
├── resources/
│   ├── pages/
│   │   └── compras.robot  # "Trabalho sujo" (Variáveis, mapeamento de elementos e ações específicas da página)
│   └── base.robot         # Configurações de inicialização e encerramento (Setup/Teardown do navegador)
├── results/               # Relatórios de execução automáticos (logs, reports de sucesso/falha)
├── tests/
│   └── compra.robot       # Casos de teste limpos, escritos em português claro (BDD)
└── .gitignore             # Arquivos e pastas ignorados pelo versionamento (como a pasta results)
