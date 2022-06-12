# LysiTech

Projeto Integrador (Programação Orientada a Objetos): Sistema de gerenciamento de ordem de serviço.


## Rodando localmente

É necessario que o PostgreSQL e o pgAdmin estejam instalados para que se possa rodar o projeto localmente.

Clone o projeto

```bash
  git clone https://github.com/antonio-cosmo/LysiTech
```

Entre no diretório do projeto

```bash
  cd app-lysitech
```

Instale as dependências

```bash
  bundle install
```

Crie o arquivo .env na raiz do projeto e adicione as seguintes variáveis de ambiente

```bash
  APP_LYSITECH_DATABASE_USERNAME=nome_do_usuario_do_BD_PostgreSQL
  APP_LYSITECH_DATABASE_PASSWORD=senha_do_usuario_do_BD_PostgreSQL
```

Inicie o setup da aplicação. Usuario padrão criado para login na aplicação (login: admin, senha: 12345)

```bash
  rails dev:setup
```

Inicie o servidor

```bash
  rails server
```
