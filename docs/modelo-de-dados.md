# Modelo implementado

O banco compartilhado pelo Java e PHP chama-se `garagem2`. Ele contém 15 tabelas centrais e três extensões do site, totalizando 18.

## Relacionamentos principais

- `enthusiast.id_enthusiast` referencia `users.id_user`.
- `workshop_owners.id_owner` referencia `users.id_user`.
- `workshops.fk_owner` referencia `workshop_owners.id_owner`: um dono pode ter várias oficinas.
- `reviews` relaciona um entusiasta e uma oficina; há uma avaliação por par.
- `guide_content.fk_guide` referencia `guides.id_guide` e guarda o conteúdo estruturado utilizado pelo site.
- `user_site_state.fk_user` referencia `users.id_user` e guarda os dados específicos da conta no site.

O cadastro contínuo de dono/oficina preenche três tabelas: `users`, `workshop_owners` e `workshops`. Isso acontece em uma transação. A chave estrangeira impede excluir um dono enquanto houver oficinas vinculadas. Outras exclusões podem remover registros dependentes por cascata, conforme o SQL.

## Tabelas

- `users`
- `enthusiast`
- `preferences`
- `guides`
- `accesses`
- `workshop_owners`
- `workshops`
- `reviews`
- `services`
- `workshop_services`
- `photos`
- `legalizations`
- `steps`
- `sources`
- `step_sources`
- `guide_content`
- `user_site_state`
- `web_login_attempts`

## Referências

O [SQL atual](../database/garagem.sql) é a referência exata para colunas, tipos, chaves e regras de exclusão. As imagens dos diagramas e a [transcrição original](historico/modelo-de-dados.md) descrevem a modelagem acadêmica anterior, com nomes em português; não são o schema de instalação da aplicação atual.
