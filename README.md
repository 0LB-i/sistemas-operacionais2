# Repositório Sistemas Operacionais 2

## Comandos Linux:

sudo apt install locate == Plugin que q se liga diretamente ao kermel do linux, é uma ferramenta de procura
sudo apt update == atualiza o sistema interno, com as modificações e etc
sudo apt install openssh == instala o openssh
sudo apt-get ipdate == para atualizar os pacote baixados

touch "nome do arquivo e extensão do mesmo" == usado normalmente para criar arquivos vazios

sudo dpkg-reconfigure tzdata == instala o tzdata para configurar o horário do servidor

sudo init 6 == Reiniciar a máquina
sudo init 0 0 == Desligar

locate conteúdo | more == Localiza exatamente o arquivo que vc procura em qualquer lugar do sistema

service conteúdo status == Mostra o status do programa

ip addr == Mostra o ip além de várias outras informações
free -h == para mostar as informações obre memória ram

cat passwd | grep "o q procurar" == Para listar (cat) e filtar (grep) para localizar uma palavra no caso um usuário 
fgrep "o q procurar" "aonde vc quer q procure" == Localizar e exibir se um item está ou não está dentro de um arquivo

groups "usuario" == lista os grupos que o usuário tem acesso, da esquerda é o primario

sudo vi shadow == ver senhas criptografadas 

man "comando" |more == Chama o manual do comando

ps -ef | grep gabriel | wc -l == conta a quantidade de processos em execução do usuário gabriel, não é 100$ correto a contagem, já que ele tbm conta o próprio processo 

htop == um top diferenciado

ntop == top para medir a rede, normalmente não está instalado 

ps -aux == é quase igual ao "ps -ef", "a" é de all, "u" de users e "x" é de em execução

sudo du -sh /var == verificar o espaço que o diretório/partição var ocupa, "s" mostra o total da pasta, e "S" mostra o total de cada pasta dentro desta, ele abre digamos assim

### Criando usuário e grupo

##### Comandos Simples

sudo adduser "usuario" == Cria um usuário
sudo addgroup "grupo" == Cria um grupo

##### Comandos complexos (Mais profissional)

sudo useradd == 
sudo groupadd ==
sudo useradd -m -b /home/gerentes -g "grupo" -s /bin/sh joao == cria uma pasta com o nome do usuário, coloca ele em um grupo e cria um usuário com o nome dele

sudo useradd -m -b /home/gerentes -g "grupo" -s /bin/bash -p $(openssl passwd -1 "senha") "usuario" == cria uma pasta ou insere se já existir uma pasta, coloca em um grupo, cria uma senha e criptografa a senha dele e cria um usuário. Mas isso deixa rastro no log

##### Deletar usuário
sudo deluser "usuario"  == Apaga o usuário

### Criando senha para usuário
sudo passwd "usuario" == cria uma senha para o usuário

sudo echo "usuario":"senha" chpasswd == muda a senha do usuário

sudo passwd "usuario" == define uma senha
sudo passwd -e "usuario" == manda trocar a senha assim q logar

### Ajuda sobre um comando

"Comando" --help == Mostra ajuda sobre esse comando, suas possibilidades

## SSH
ssh gabriel@127.0.1.1 -p22 == comando para ir para dentro do servidor pelo visual studio code

porta padrão do ssh é 22 ou 23

## GIT

#### create a new repository on the command line

echo "# sistemas-operacionais2" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://link
git push -u origin main

#### push an existing repository from the command line

git remote add origin https://link
git branch -M main
git push -u origin main

sudo apt install tree == instala o tree

tree -P *."extensão" == mostra uma lista em formato de ramificação das pastas com os arquivos que eu estou procurando


## Baixar o APACHE

sudo apt install apache2 == instala o apache

sudo service apache2 status == verifica o status do apache

porta padrão do apache é 80

## portas tcp/ip    

sudo ufw allow 8085/tcp == libera a porta
sudo ufw dany 8085/tcp == bloqueia a porta

sudo ufw app list == lista de ufw liberadas

## Docker

sudo apt-get remove docker == remove vestigios de docker pelo sistema
sudo apt install curl == instala o curl
mkdir docker == cria uma pasta chamada docker
cd docker/ == entra na pasta docker criada
curl -fsSL https://get.docker.com -o get-docker.sh == para instalar o docker
sh get-docker.sh
sudo docker run -it ubuntu:20.04 /bin/bash == baixa e rodo o docker do ubuntu e o (-it) faz eu entrar no container
sudo docker images == imagens que você têm no sistema
sudo docker container ps == lista os contâiners em execução 
sudo docker container ps -a == lista todos os contâiners 
sudo docker rm (container id) == para matar o contâiner 
sudo docker rm $(docker ps -qa) == mata todos os containers inativos
sudo docker rm $(docker ps -qa) -f == mata todos os containers

### Comando paa rodar o NGINX na porta 8081 do nosso PC windows
sudo docker run --name mynginx2 -p 8081:80 -d nginx
sudo docker run -i -t --volumes-from mynginx4 --name mynginx4_files debian /bin/bash

sudo docker run -it -v/var/www/html/:/usr/share/nginx/html -p 8081:80 nginx