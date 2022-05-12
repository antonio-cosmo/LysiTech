# LysiTech

Projeto Integrador (Programação Orientada a Objetos): Sistema de gerenciamento de ordem de serviço.


## Rodando localmente

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
  APP_LYSITECH_DATABASE_USERNAME=valor
  APP_LYSITECH_DATABASE_PASSWORD=valor
```

Inicie o setup da aplicação

```bash
  rails dev:setup
```

Inicie o servidor

```bash
  rails server
```
