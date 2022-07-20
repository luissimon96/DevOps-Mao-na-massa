# DevOps-Mao-na-massa

- Olá seja bem vindo ao arquivo de instrução de como você pode utilizar esse código

- Utilizei o Vagrant e o Ansible para criar e provisionar a infra estrutura deste curso
- Então primeiro devemos instalar essas ferramentas em sua máquina

- Após a conclusão da instalação podemos seguir com o clone do repositório, eu recomendo a realização de um Fork deste projeto para que consiga editar o que quiser, fique á vontade

- Já podemos iniciar nosso Lab com o comando em todos os hosts a serem iniciados:
  vagrant up #Este comando irá provisionar e criar todos as máquinas
  vagrant ssh #Este comando é responsável para acessar a máquina já criada e iniciada

- Inserir no Control node os grupos para que o ansible consiga conectar quando executarmos os testes sem que seja necessário configurarmos nenhum DNS na rede:
  sudo vi /etc/ansible/hosts

  - Conteúdo a ser adicionado:
    [apps]
    app01
    [dbs]
    db01

- Instalar o ansible-galaxy para que seja possível executar o playbook do db01.yml
  ansible-galaxy install geerlingguy.mysql

- Fazendo isso conseguiremos prosseguir

- Primeira coisa que precisamos realizar sempre que iniciamos o projeto localmente
- Criar a chave privada e pública nos hosts, assim criando a relação de confiança entre as máquinas
- Fazendo com que o Control-Node consiga acessar os demais hosts sem utilizar a senha

- no Control-Node devemos executar o comando para gerar as senhas:
  ssh-keygen

- acessar o diretório padrão que definimos oa rodar no comando acima /home/vagrant/.ssh/
  cd /home/vagrant/.ssh/
  ls -la

  - dentro deverá ter 3 arquivos:
    authorized_keys
    id_rsa
    id_rsa.pub

- Copiar a chave pública do arquivo id_rsa.pub
  cat id_rsa.pub

- Adicionar o conteúdo no arquivo authorized_keys dos hosts onde o Control-Node poderá acessar
- Para que isso ocorra basta incluír o conteúdo no provision.sh que está dentro de cada máquina, app01/provision.sh e db01/provision.sh

- Realizar o force de provisionamento de todos os hosts, pois o provisionamento acontece somente na criação da máquina e depois ele não executa novamente.
  vagrant reload --provision

- Para testar a efetividade da conexão basta acessar o Control-Node:
  vagrant ssh

  - Já dentro do host executar um comando de ssh até um host por exemplo o app01:
    ssh vagrant@app01

- Inserir no Control node os grupos para que o ansible consiga conectar quando executarmos os testes:
  sudo vi /etc/ansible/hosts

- Conteúdo a ser adicionado:
  [apps]
  app01

[dbs]
db01

- Fazendo isso conseguiremos prosseguir
