# Garagem

Projeto de uma plataforma para entusiastas automotivos consultarem guias de modificação e regularização e encontrarem oficinas.

## Arquivos

| Caminho | Conteúdo |
|---|---|
| [docs/documentacao-garagem.pdf](docs/documentacao-garagem.pdf) | Escopo e requisitos do projeto |
| [docs/modelo-de-dados.md](docs/modelo-de-dados.md) | Transcrição dos diagramas e decisões de modelagem |
| [docs/diagramas/](docs/diagramas/) | Diagramas originais e modelo conceitual revisado |
| [database/garagem.sql](database/garagem.sql) | Esquema MySQL com 15 tabelas e 15 chaves estrangeiras |

## Criar o banco local

Use MySQL 8.0.16 ou superior e uma conta com permissão para criar o esquema. No MySQL Workbench, abra `database/garagem.sql` em uma conexão e execute o arquivo inteiro. Pelo terminal, a partir da raiz do repositório:

```sh
mysql -u SEU_USUARIO -p < database/garagem.sql
```

O script cria o banco `garagem` e as tabelas ausentes. Em uma instalação que já tenha tabelas com o mesmo nome, confira sua estrutura antes de aplicar mudanças. Os campos `cep`, `logradouro`, `numero` e `complemento` ficam em `oficina`.

## Versão

A tag `v0.1.0` marca a primeira versão do esquema publicada junto com a documentação e os diagramas.
