@echo off

echo "127.0.0.1 ict187.ch" >> C:\windows\system32\drivers\hosts 
docker image build -t server-php . 
echo "Executer cette commande pour lancer le serveur :"    
echo "docker run -p 80:80 -it server"