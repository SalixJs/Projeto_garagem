# Garagem

## Visão geral

O Garagem é um projeto de aplicativo gratuito, pensado para celular e voltado a pessoas que modificam ou pretendem modificar seus carros no Brasil. Seu objetivo é facilitar duas decisões antes de gastar com uma modificação: entender quais etapas de regularização precisam ser investigadas e encontrar uma oficina que ofereça o serviço desejado.

O público inicial são entusiastas automotivos, especialmente iniciantes. Oficinas especializadas participam como estabelecimentos do diretório e podem ganhar recursos próprios em uma fase posterior.

## Experiência planejada

1. A pessoa escolhe o tipo de modificação e consulta um guia com etapas, documentos, fontes e data de revisão.
2. Ela busca oficinas por região ou localização autorizada e refina os resultados por distância, serviço e especialidade.
3. No perfil da oficina, consulta endereço, serviços, canais de contato e valores informados, quando disponíveis.
4. O contato acontece diretamente com a oficina.

Os guias têm caráter informativo e indicam as fontes para que o leitor possa confirmar a orientação com os órgãos competentes. A revisão dos guias e do diretório fica a cargo de pessoas autorizadas.

## Escopo do MVP

| Área | Entrega planejada |
|---|---|
| Guias | Catálogo por tipo de modificação, orientações de regularização, etapas, documentos, fontes e data de atualização |
| Oficinas | Busca e filtros, perfil com endereço e serviços, e acesso aos canais de contato |
| Preços | Exibição de valores ou faixas fornecidos pela oficina, quando houver dados confiáveis, com a data de atualização |
| Administração | Acesso autorizado para cadastrar, revisar e atualizar guias e registros de oficinas |

O MVP é um guia informativo e um diretório. A contratação e o pagamento acontecem diretamente com a oficina. A experiência é planejada para Android e iOS, com atenção à legibilidade, ao contraste e ao uso da localização mediante permissão.

## Andamento

O escopo e os requisitos estão documentados. Os modelos de dados e o esquema MySQL de 15 tabelas foram publicados na tag [v0.1.0](https://github.com/SalixJs/Projeto_garagem/tree/v0.1.0) e o esquema foi validado no MySQL local. Esses materiais são a base para implementar o aplicativo.

| Situação | Trabalho |
|---|---|
| Entregue no repositório | Documentação, diagramas e esquema de dados |
| Planejado para o MVP | Implementar a consulta aos guias, a busca de oficinas e a administração do catálogo |
| A validar | Formação do diretório inicial, rotina de atualização das fontes e sinalização de conteúdo incorreto |
| Fase posterior | Guias técnicos, avaliações, cadastro autônomo de oficinas e serviços personalizados |

O modelo de dados já inclui estruturas para avaliações e perfis de donos de oficina. As funcionalidades correspondentes continuam na fase posterior do produto. Destaque comercial e geração de contatos dependem de validação com as oficinas.

## Materiais do projeto

- [Documento de referência e requisitos detalhados (PDF)](documentacao-garagem.pdf)
- [Diagramas conceitual e lógico](diagramas/)
- [Transcrição dos diagramas e decisões de modelagem](modelo-de-dados.md)
- [Esquema MySQL](../database/garagem.sql)
