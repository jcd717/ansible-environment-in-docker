Environnement Ansible dans un container Docker
==============================================

Au jour du démarrage de ce besoin (07/2020), je n'ai trouvé que: https://hub.docker.com/r/geerlingguy/docker-ubuntu1604-ansible, qui a le mérite de lancer l'environnement une seule fois en mode daemon puis on se connecte au container pour faire les commandes `ansible`.  
Mais cela ne contient les pages de `man` (pour faire `man ansible` par exemple).

Objectif
--------

Une image de container qu'il suffit de lancer via `run` pour être dans un `shell` avec tout l'environnement `Ansible`.

Le shell doit être minimaliste mais extensible. Je choisi donc alpine qui a un *package manager*: `apk`.

Bien sûr, lors du `run`, il vaut mieux monter un volume docker (`-v`) qui contient le projet Ansible.


Utilisation
-----------

```
docker pull jcd717/ansible:python3.7.8-alpine
```
```
docker run -it --rm -v $PWD:/ansible-project jcd717/ansible:python3.7.8-alpine
```
Puis dans le container, afin de tester l'environnement:
```
cd ansible-project
ansible localhost -m ping
ansible-playbook update-json.yml
```
