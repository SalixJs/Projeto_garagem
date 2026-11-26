# Estado atual do Garagem

Atualizado em 25/11/2026.

O Garagem reúne guias de modificações automotivas e informações sobre oficinas. O projeto começou pela documentação e modelagem acadêmica e evoluiu para um site PHP e um console administrativo Java, conectados ao mesmo banco MySQL.

## Fluxos implementados

O visitante consulta guias e oficinas. O cadastro distingue entusiastas e donos de oficina. Os donos cadastram os dados do estabelecimento; os entusiastas podem avaliar oficinas. Preferências e informações específicas do usuário ficam associadas à sua conta.

No console Java, o usuário escolhe entre usuários, oficinas, guias e avaliações, com cadastro, listagem, consulta, edição e exclusão. Ao cadastrar um dono, o preenchimento continua para a primeira oficina. A gravação usa uma transação: se a oficina falhar, o cadastro do responsável também é desfeito. Oficinas adicionais podem ser vinculadas a um dono existente.

## Arquitetura

Java com Model, View, Controller, DAO e Util. A View trata a interação no console, o Controller coordena as operações e os DAOs fazem a persistência por JDBC e PreparedStatement. Os perfis de usuário usam herança. As senhas são protegidas com hash PBKDF2; não aparecem nas listagens.

O site utiliza PHP, HTML, CSS e JavaScript. Os conteúdos dos guias são consultados no MySQL. Java e PHP compartilham o formato de senha e o banco `garagem2`.

## Escopo e limites

O CRUD Java cobre usuários, oficinas, guias e avaliações; serviços, fotos e preferências são atendidos pelos fluxos web correspondentes. O console é administrativo e depende das permissões da conta MySQL configurada.

O catálogo exibe apenas oficinas cadastradas; exemplos demonstrativos antigos não são mais exibidos. A validação comercial das oficinas, manutenção contínua das fontes, preços, cálculo de distâncias e aplicativos nativos não são declarados concluídos.

## Execução e histórico

Código e instruções: [garagem_prototipo](https://github.com/SalixJs/garagem_prototipo).

O PDF e os diagramas originais permanecem como referências históricas. Para instalar o sistema atual, use o SQL de `database/garagem.sql`, que cria `garagem2`; o SQL original em português está em `database/historico`.
