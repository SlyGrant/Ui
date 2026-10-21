# Ui 

Bienv'nue sur Ui !

Ui est un lab Docker pour m'amuser et expérimenter en même temps. J'avais envie de faire un hub via Heimdall
et d'y proposer quelques services que vous aurez à configurer, ou retirer/modifier au besoin !

Le titre l'indique bien, je ne me prends pas la tête donc faites ça sur une VM dont vous n'avez rien à faire.

## Applications disponibles

- Heimdall
- WordPress
- Nginx Proxy Manager
- Zabbix

## Installation et configuration

Sur une VM Linux.
Premières commandes :
git clone https://github.com/SlyGrant/Ui.git  

cd Ui
 
Les mots de passe que je fournis sont à changer ! Vous pourrez les voir dans le .env en faisant 
La commande :
cat .env

Un script est disponible pour proposer des noms de domaine en local dans votre fichier hosts /etc/hosts (raison de plus pour le faire sur une VM) que vous pourrez
accepter ou refuser.
Les commandes :  

chmod +x install.sh  

./install.sh

Si vous refusez, vous n'avez qu'à configurer les noms de domaine vous-mêmes
Le script ne s'occupe de rien d'autre donc à vous de faire le reste avec :
docker compose up -d
Et si vous voulez vérifier que tout fonctionne :
docker compose ps

## Règles de redirection sur Nginx Proxy Manager

N'oubliez pas de faire vos règles de redirection sur Nginx Proxy Manager !

Dans votre navigateur, mettez :

http://localhost:8092

Puis dans **Hosts → Proxy Hosts → Add Proxy Host**.

Les règles à ajouter (si vous avez accepté les noms de domaine):

| Domain Names | Forward Hostname / IP | Forward Port |
|---|---|---|
| hub.ui.test | heimdall | 80 |
| wordpress.ui.test | wordpress | 80 |
| zabbix.ui.test | zabbix-web | 8080 |
| npm.ui.test | nginx-proxy-manager | 81 |

N'oubliez pas que votre Heimdall sera probablement vide, donc ajoutez les services que vous voulez !

Pour accéder aux services si vous avez accepté l'ajout des noms de domaine :  

Heimdall : http://hub.ui.test  

WordPress : http://wordpress.ui.test  

Zabbix : http://zabbix.ui.test  

Nginx Proxy Manager : http://npm.ui.test   


Pour y accéder si vous avez refusé :  


Heimdall : http://localhost:8090  

WordPress : http://localhost:8091  

Zabbix : http://localhost:8093  

Nginx Proxy Manager : http://localhost:8092  


Voilà voilà. Ui.

Ui, j'avais beaucoup d'inspiration. 
