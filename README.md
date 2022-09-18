# README

This README would normally document whatever steps are necessary to get the
application up and running.

dbdiagram: https://dbdiagram.io/d/630fa9240911f91ba50abdef

Iniciar:

- bundle install
- rails db:create
- rails db:migrate
- rails db:seed

Antes do push, lembre sempre de rodar os testes e linter:

- rspec spec
- rubocop -A

Versão do ruby: 2.7.4

Versão do rails: 6.1.5

Banco de dados: postgresql

Porta do server: 3333

Variáveis utilizadas em /config/application.yml (figaro):

Pro banco de dados:

- db_user
- db_password
