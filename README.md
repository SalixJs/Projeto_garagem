# Garagem

Documentação do projeto de guias de modificações automotivas e busca de oficinas. A implementação atual reúne um site PHP adaptado para celular e um console Java, ambos conectados ao MySQL `garagem2`.

**Integrante:** Matheus Otávio Salvador.

## Repositórios

- **Projeto_garagem:** proposta, evolução, modelo de dados e documentação.
- **[garagem_prototipo](https://github.com/SalixJs/garagem_prototipo):** código Java e PHP, testes, dependências e instalação. Use esse repositório para executar o sistema e para a entrega de MVC/DAO/CRUD.

## O que está implementado

- Cadastro de entusiastas e donos de oficina.
- Cadastro contínuo de dono e oficina, com vínculo automático e transação no Java.
- CRUD de usuários, oficinas, guias e avaliações no console Java.
- Site com login, guias consultados do banco, oficinas, avaliações e preferências do usuário.
- Catálogo com 11 guias iniciais, oficinas cadastradas e avaliações dos usuários.

A versão atual é web e console; não é um aplicativo nativo Android/iOS. Os guias informativos não substituem a confirmação das exigências aplicáveis à modificação.

## Documentação

- [Estado atual e escopo](docs/projeto.md)
- [Modelo de dados atual](docs/modelo-de-dados.md)
- [SQL completo para MySQL](database/garagem.sql)
- [Instruções do banco](database/README.md)
- [Documento acadêmico original (histórico)](docs/documentacao-garagem.pdf)
- [Diagramas originais de referência](docs/diagramas/)

## Validação e autoria

Em 25/11/2026, o Java passou em 69 verificações de integração e console em banco isolado, incluindo CRUD, transações e cadastro conjunto de dono/oficina. A implementação foi desenvolvida e revisada com auxílio do Codex, incluindo site, Java, SQL, testes e documentação. O aluno forneceu a versão inicial e definiu os requisitos e ajustes; não se declara autoria exclusiva dos trechos produzidos com IA.

Materiais históricos registram versões anteriores e não descrevem integralmente a implementação atual.
