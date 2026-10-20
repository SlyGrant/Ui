#!/usr/bin/env bash
set -euo pipefail

echo "=================================="
echo "       Bienv'nue sur Ui !"
echo "=================================="
echo
echo "Ui est une expérience donc c'est à installer sur une VM de test"
echo

read -r -p "Configurer les noms de domaine dans /etc/hosts pour Heimdall ? (o/N) : " reponse

if [[ "$reponse" =~ ^[oOyY]$ ]]; then
    echo
    echo "J'configure tout ça alors attends..."

    # Sauvegarde avant modification
    sudo cp -p /etc/hosts "/etc/hosts.ui-backup-$(date +%Y%m%d-%H%M%S)"

    # Bloc identifiable pour faciliter une future désinstallation
    if grep -qF '# BEGIN UI LAB' /etc/hosts; then
        echo "Une configuration Ui existe déjà dans /etc/hosts."
        echo "Champion(ne) !"
    else
        printf '\n# BEGIN UI LAB\n127.0.0.1 hub.ui.test wordpress.ui.test zabbix.ui.test npm.ui.test\n# END UI LAB\n' \
            | sudo tee -a /etc/hosts > /dev/null

        echo "Tout est bon !"
    fi
else
    echo
    echo "Aucune modification de /etc/hosts."
    echo "Les noms personnalisés ne seront pas accessibles sans configuration DNS."
fi

echo
echo "Première étape terminée !"
