# Repositório Sistea Operacionais 2

## Comandos Linux:

sudo apt install locate == Plugin que q se liga diretamente ao kermel do linux, é uma ferramenta de procura
sudo apt update == atualiza o sistema interno, com as modificações e etc
sudo apt install openssh == instala o openssh
sudo apt-get ipdate == para atualizar os pacote baixados


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

### Criando usuário

sudo adduser "usuario" == Cria um usuário

## SSH
ssh gabriel@127.0.1.1 -p22 == comando para ir para dentro do servidor pelo visual studio code

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






