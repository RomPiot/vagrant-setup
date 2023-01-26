
## Installation sur Windows

### Installer Hyper V

Ouvrir PowerShell en tant qu'administateur, et executer :

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```


### Installer Vagrant

Télécharger et installer la dernière version de Vagrant [disponible ici](https://developer.hashicorp.com/vagrant/downloads), prenant la version AMD64


## Utilisation

### Démarrer le projet

```powershell
vagrant up --provider hyperv
```



### Mettre à jour le projet vagrant

```powershell
vagrant reload
```
