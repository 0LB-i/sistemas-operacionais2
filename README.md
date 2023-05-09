# Repositório Sistemas Operacionais 2

## Permissões

### Valor de cada permissão

Read (R) = 4
Write (W) = 2
execute (X) = 1
(-) = 0

d = se tiver um de antes significa que é uma pasta/diretório

## Comandos Linux:

sudo apt install locate == Plugin que q se liga diretamente ao kermel do linux, é uma ferramenta de procura
sudo apt update == atualiza o sistema interno, com as modificações e etc
sudo apt install openssh == instala o openssh
sudo apt-get ipdate == para atualizar os pacote baixados

jobs == lista os processos que eu coloquei para rodar em segundo plano

touch "nome do arquivo e extensão do mesmo" == usado normalmente para criar arquivos vazios

sudo dpkg-reconfigure tzdata == instala o tzdata para configurar o horário do servidor

sudo init 6 == Reiniciar a máquina
sudo init 0 == Desligar

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

## Find

find --help | less == Documentação
sudo find /etc -name passwd == localizar (find) nesta pasta (/etc) pelo nome (-name) nome (passwd)
sudo find /etc -iname '*passwd*' == localizar nesta pasta pelo nome e CASE sensitive (-iname) que contenha a palavra ('*passwd*')
sudo find /usr/share/ -size +10M == localizar nesta pasta os arquivos que passam de 10 megabytes(-size +10M)
sudo find /usr/share/ -size -100M == localizar nesta pasta os arquivos que são menores que 100 megabytes(-size -100M)
sudo find /usr/share/ -size -100M | wc - l == conta a quantidade de arquivos que são menores que 100 megabytes
sudo find /usr/share/ -size +500M -size -5G == localiza nesta pasta os arquivos maiores que 500 megabytes e menores que 5 gigabyte
sudo find /var/log/ -size +500M -size -1G -exec du -sh {} \; == o (-exec) é o pipe do find para executar um comando em sequência
sudo find /home -user gabriel -ls == lista tudo do usuário (gabriel) na pasta (/home)
sudo find /home -user gabriel -or -user suporte1 -ls == (-or) é o OU, ou um ou outro, se não tiver algum dos dois ele devolve que o user não existe, e se tiver os dois ele só mostra o último por que ele têm prioridade
sudo find /var/spool -not -user root -ls == lista todos os arquivos da pasta que não é (-not) do usuário (root)
sudo find /bin -perm 755 -ls == lista da pasta os usuáios com permissão (755) == é possível localizar também, permissões maiores (+755) ou menores (-755)
sudo find / -perm 750 -type d -ls == busca em todo o sistema, diretórios (-type d) com permissão (750) 
sudo find /var/www -mmin -20 == busca os arquivos que foram editados/criados/movidos nos últimos 20 minutos e é dois mm mesmo
sudo find /bin /var/www -ctime 30 == busca os arquivos criados nesses dois diretórios nos últimos 30 dias
sudo find /bin -atime +30 == busca todo tipo de arquivo modificado/criado/movimentado/tudo dentro desse diretório a mais de 30 dias
sudo find /usr/share -size +3M -exec du -h {} \; | sort -nr == lista os arquivos com mais de 3 megabytes e (-exec "que é igual ao |") listo o tamanho do arquivo em formato humano (du -h)  e (|) na ordem (sort) de tamnho (-n) reverso (r)


## Script 

echo $(comando) == basicamente é assim que se constrói um script
