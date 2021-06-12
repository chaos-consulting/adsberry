# ADS-B ansible Role

Ansible Playbooks für das installieren von ADS-B auf einem Pi


## Vorbereitungen

### Linux Ubuntu

Ansible per PPA hinzufügen

```bash
sudo add-apt-repository ppa:ansible/ansible
sudo apt update
```

Ansible nun installieren mit `sudo apt install ansible`



## Aufruf

Passe deine Konfiguation in der [hosts.yaml](hosts.yaml) an.

Hinweis: *-K* bewirkt, dass nach dem Passwort vom Benutzer pi gefragt wird um die Befehle mit sudo Rechten auszuführen.

Um das Playbook auszuführen führe folgenden Befehl aus:

```bash
ansible-playbook -i hosts.yaml playbook_adsb.yaml -e 'ansible_python_interpreter=/usr/bin/python3' -K

```
