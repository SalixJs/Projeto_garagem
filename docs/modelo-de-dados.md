# Garagem

## Transcrição do modelo conceitual

O asterisco indica o atributo identificador.

- Login — email, id_login*, senha.
- Usuario — nome, email, senha, id_usuario*.
- Preferencias — id_preferencia*, idioma, tamanho_letra, cor.
- Entusiasta — cidade, id_entusiasta*.
- Dono de oficina — nome_responsavel, telefone, id_donoOficina*.
- Avaliacao — id_avaliacao*, descricao, data, estrelas.
- Oficina — id_oficina*, complemento, horarios, logo, nome_fantasia, razao_social, CNPJ, descricao, CEP, logradouro.
- Servicos — id_servico*, nome, descricao, categoria.
- Fotos — id_foto*, imagem.
- Guia — titulo, descricao, id_guia*, categoria, custo_estimado, exige_regularizacao.
- Legalizacao — id_legalizacao*, data_atualizacao.
- Etapas — id_etapa*, numero, titulo, descricao, documentos_necessarios, valor.
- Fonte — id_fonte*, nome, referencia, data_consulta, orgao.

As cardinalidades abaixo estão na ordem dos lados desenhados. Usuario tem duas especializações, Entusiasta e Dono de oficina.

| Entidade | Relação | Entidade |
|---|---|---|
| Login (1,1) | Realiza | Usuario (1,n) |
| Usuario (1,1) | Possui | Preferencias (1,1) |
| Usuario (1,1) | Acessa | Guia (0,n) |
| Entusiasta (1,1) | Avalia | Avaliacao (0,n) |
| Entusiasta (1,1) | Procura | Oficina (0,n) |
| Avaliacao (0,n) | Recebe | Oficina (0,n) |
| Dono de oficina (1,1) | Cadastra | Oficina (1,1) |
| Oficina (1,n) | Registra | Servicos (1,n) |
| Oficina (1,1) | Possui | Fotos (1,n) |
| Guia (1,n) | possui | Legalizacao (1,1) |
| Legalizacao (1,1) | Possui | Etapas (1,n) |
| Etapas (1,n) | Possui | Fonte (1,n) |

## Transcrição do modelo lógico

A imagem original e o SQL descrevem o modelo de 15 tabelas.

PK indica chave primária. FK indica chave estrangeira. Os trechos cortados na imagem foram completados conforme indicado na revisão.

- usuario — id_usuario INT [PK], nome VARCHAR(150), email VARCHAR(150), senha VARCHAR(255), cidade VARCHAR(100).
- preferencias — id_preferencia INT [PK], idioma VARCHAR(30), tamanho_letra VARCHAR(20), cor VARCHAR(30), fonte VARCHAR(50), fk_usuario INT [FK para usuario.id_usuario].
- entusiasta — id_entusiasta INT [PK] [FK para usuario.id_usuario].
- dono_oficina — id_dono_oficina INT [PK] [FK para usuario.id_usuario], nome_responsavel VARCHAR(150), telefone VARCHAR(20).
- oficina — id_oficina INT [PK], nome_fantasia VARCHAR(150), razao_social VARCHAR(150), cnpj VARCHAR(20), descricao TEXT, logo VARCHAR(255), horarios VARCHAR(255), cep VARCHAR(10), logradouro VARCHAR(150), numero VARCHAR(10), complemento VARCHAR(100), fk_dono_oficina INT [FK para dono_oficina.id_dono_oficina].
- avaliacao — id_avaliacao INT [PK], data DATE, estrelas TINYINT, descricao TEXT, fk_entusiasta INT [FK para entusiasta.id_entusiasta], fk_oficina INT [FK para oficina.id_oficina].
- servicos — id_servico INT [PK], nome VARCHAR(100), descricao TEXT, categoria VARCHAR(50).
- registra — fk_oficina INT [PK] [FK para oficina.id_oficina], fk_servico INT [PK] [FK para servicos.id_servico].
- fotos — id_foto INT [PK], imagem VARCHAR(255), fk_oficina INT [FK para oficina.id_oficina].
- guia — id_guia INT [PK], titulo VARCHAR(150), descricao TEXT, categoria VARCHAR(50), custo_estimado VARCHAR(50), exige_regularizacao TINYINT(1).
- acessa — fk_usuario INT [PK] [FK para usuario.id_usuario], fk_guia INT [PK] [FK para guia.id_guia], data_acesso DATETIME [PK].
- legalizacao — id_legalizacao INT [PK], data_atualizacao DATE, fk_guia INT [FK para guia.id_guia].
- etapas — id_etapa INT [PK], numero INT, titulo VARCHAR(150), descricao TEXT, documentos_necessarios TEXT, valor VARCHAR(50), fk_legalizacao INT [FK para legalizacao.id_legalizacao].
- fonte — id_fonte INT [PK], nome VARCHAR(150), orgao VARCHAR(150), referencia VARCHAR(255), data_consulta DATE.
- possui — fk_etapa INT [PK] [FK para etapas.id_etapa], fk_fonte INT [PK] [FK para fonte.id_fonte].

## Revisão e decisões para o MySQL

- A implementação segue o modelo lógico como base. Na imagem do lógico, as credenciais e cidade ficam em usuario, fonte fica em preferencias e numero aparece em oficina. Os campos de endereço ficam em oficina. Login e Procura aparecem apenas no conceitual. Procura fica representada como uma busca, sem persistência no esquema.
- Entusiasta e dono_oficina usam o ID de usuario como chave primária e estrangeira. Assim, cada usuário pode ter no máximo um registro de cada perfil.
- Preferencias recebe uma restrição UNIQUE em fk_usuario para refletir o limite de uma preferência por usuário do conceitual. O cadastro de preferências é opcional.
- Cada avaliação referencia um entusiasta e uma oficina. O SQL segue as FKs do lógico para os vínculos entre dono e oficina e entre guia e legalização. Assim, um dono pode ter várias oficinas e um guia pode ter várias legalizações.
- As relações entre oficinas e serviços e entre etapas e fontes usam tabelas associativas com chaves compostas. A chave de acessa também inclui a data e hora para permitir acessos repetidos ao mesmo guia em horários diferentes.
- Tipos e nomes completados onde a imagem corta o texto: preferencias.tamanho_letra VARCHAR(20), usuario.cidade VARCHAR(100), acessa.data_acesso DATETIME, guia.exige_regularizacao TINYINT(1), legalizacao.data_atualizacao DATE, etapas.documentos_necessarios TEXT, avaliacao.fk_entusiasta INT, dono_oficina.nome_responsavel VARCHAR(150), oficina.nome_fantasia VARCHAR(150), servicos.categoria VARCHAR(50), fotos.imagem VARCHAR(255) e fonte.referencia VARCHAR(255). Os títulos abreviados foram lidos como entusiasta, avaliacao e possui.
- O SQL gera IDs independentes automaticamente, exige as referências nas FKs e valida estrelas de 1 a 5 e exige_regularizacao como 0 ou 1. A aplicação deve armazenar em senha o hash da senha.


## Modelo conceitual revisado

A seção de transcrição preserva a leitura das imagens originais. No diagrama revisado, o rótulo junto de cada entidade indica quantas instâncias dela podem se relacionar com uma instância da outra entidade.

| Entidade | Relação | Entidade |
|---|---|---|
| Usuario (1,1) | Possui | Preferencias (0,1) |
| Usuario (0,n) | Acessa (data_acesso) | Guia (0,n) |
| Entusiasta (1,1) | Avalia | Avaliacao (0,n) |
| Avaliacao (0,n) | Recebe | Oficina (1,1) |
| Dono de oficina (1,1) | Cadastra | Oficina (0,n) |
| Oficina (0,n) | Registra | Servicos (0,n) |
| Oficina (1,1) | Possui | Fotos (0,n) |
| Guia (1,1) | Possui | Legalizacao (0,n) |
| Legalizacao (1,1) | Possui | Etapas (0,n) |
| Etapas (0,n) | Possui | Fonte (0,n) |

- Cada legalização pertence a um guia. Um guia pode ter zero ou várias legalizações. Cada oficina tem um dono. Um dono pode ter zero ou várias oficinas. Com a convenção adotada, o lado que pode ter vários registros é o da entidade que contém a FK.
- Os mínimos opcionais refletem o que o SQL aceita. Por exemplo, um usuário pode existir antes que suas preferências sejam cadastradas.
- Login foi incorporado a Usuario. Procura foi mantida no desenho como operação de busca, em linha tracejada.
- Usuario recebe cidade. Preferencias recebe fonte. Oficina inclui numero junto com CEP, logradouro e complemento.
- A especialização de Usuario é parcial e sobreposta. Um usuário pode ter nenhum, um ou ambos os perfis. Cada perfil usa o identificador herdado de Usuario.

### Ajustes para o modelo lógico no Workbench

- Represente cada vínculo com o perfil como Usuario (1,1) para Entusiasta (0,1) ou Dono de oficina (0,1), mantendo a identificação pela PK que também é FK.
- Confira o destino da FK dono_oficina.id_dono_oficina na aba Foreign Keys. A referência correta, já expressa no SQL, é usuario.id_usuario. A posição da linha na imagem pode confundir a leitura.
- A imagem do lógico é uma exportação PNG. A edição desses vínculos no Workbench exige o arquivo de modelo .mwb.

### Melhorias opcionais levantadas

As sugestões de UNIQUE para email e CNPJ e de ON DELETE CASCADE para fotos, registra e etapas dependem das regras de cadastro e exclusão. Elas ficam registradas para decisão antes de alterar o SQL.


### Regras de participação e convenção do diagrama

Os mínimos de Oficina–Servicos, Oficina–Fotos, Etapas–Fonte e Legalizacao–Etapas continuam em zero para refletir o SQL. Se o projeto exigir, por exemplo, ao menos um serviço por oficina ou uma fonte por etapa, use mínimo 1 no lado de Servicos ou Fonte neste SVG e valide a regra no cadastro e na remoção do último vínculo. O mesmo raciocínio vale para fotos e etapas.

A legenda do SVG informa como ler os rótulos. Confirme a convenção esperada com o professor. Se ele usar a convenção em que o rótulo descreve a participação da própria entidade, inverta os rótulos nas duas pontas de cada relacionamento e atualize a legenda.
