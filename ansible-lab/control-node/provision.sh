#/bin/sh
sudo yum -y install epel-release
echo "Início da instalação do Ansible"
sudo yum -y install ansible
sudo ansible-galaxy install geerlingguy.mysql
cat <<EOT >> /etc/hosts
192.168.1.2 control-node
192.168.1.3 app01
192.168.1.4 db01
EOT

cat <<EOT >> /etc/exports
modprobe nfs
modprobe nfsd
EOT

# Criando a relação de confiança nos hosts que o control-node acessa
# Copiando a chave pública para os hosts remotos
# Assim criamos a relação de confiança e o ssh na porta 22 vai ser liberado.
# Caso não faça isso a máquina do control node não irá conseguir acessar as demais

# no control-node gerar e depois buscar a chave publica e copiar
# ssh-keygen # executar apenas uma vez para que seja possível a criação da chave pública e privada
# cd /home/vagrant/.ssh
# cat id_rsa.pub
# copiar e colocar o conteúdo nos arquivos de privisionamento dos hosts

# nas máquinas que o control-node irá acessar
