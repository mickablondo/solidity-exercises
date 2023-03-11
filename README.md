# solidity-exercises
## Description des exercices
Regroupe l'ensemble des exercices réalisés pour apprendre solidity :  
  
1 - Tester un getter/setter sur différents types de variable pour savoir comment compiler, déployer le contrat sur une blockchain (via [Ganache](https://trufflesuite.com/ganache/)) et jouer avec.  
2 - Tester les transactions d'ether, cumuler les sommes envoyées et récupérer la dernière adresse qui a payé.  
3 - Tester le type 'mapping' et le bloc if/else pour cumuler les sommes d'argent envoyées par une même adresse.  
4 - Tester le type 'struct' pour cumuler les sommes d'argent envoyées et le nombre de paiements réalisés par l'adresse qui interroge le smart contract.  
5 - Créer un wallet pour envoyer de l'argent à quelqu'un en partie ou entièrement, ou, récupérer tout son propre argent.  
6 - Tester les tableaux de type storage et memory.  
7 - Gestion des résultats des matchs de basket d'une équipe (ENUM, Mapping+Array+Struct, date, boucle for).  
8 - Jeu pour retrouver le nombre que le propriétaire du contrat a placé (constructor / selfdestruct, require / revert / assert).  
9 - Projet Solidity présenté par [Ben BK](https://www.youtube.com/@BenBK) : [Gestionnaire d'élève](https://www.youtube.com/watch?v=fLi70h1Vje8&list=PLBV4f2pTYexqgdiVpLOWlF-E5sTLPimot&index=15) revu avec une gestion des matières pré-définies en tableau (struct in struct / array / mapping / bytes / require / for)  

## Environnement de travail
### Outils
 - [VS Code](https://code.visualstudio.com/)
 - [Plugin Ethereum Remix](https://github.com/ethereum/remix-vscode)
 - [Ganache](https://trufflesuite.com/ganache/)

### Déploiement d'un smart contract
1. Développement sur [VS Code](https://code.visualstudio.com/).  
2. Sur le [plugin Ethereum Remix](https://github.com/ethereum/remix-vscode), je choisis mon compiler (Set compiler version), je clique sur "Run & Deploy" et choisis "Activate".  
3. Je lance [Ganache](https://trufflesuite.com/ganache/) et utilise le "Quickstart".  
4. Sur le [plugin Ethereum Remix](https://github.com/ethereum/remix-vscode), je me connecte au noeud privé généré par Ganache en cliquant sur "Connect".
5. Je choisis mon smart contract, je compile et je le déploie.  
![](images/remix_connect.png)  
![](images/remix-compiledeploy.png)  
6. Il ne me reste plus qu'à jouer avec !  
![](images/remix-tryit.png)  

## Inspirations
 - [Ben BK](https://www.youtube.com/@BenBK)
 - [Documentation officielle](https://docs.soliditylang.org/)
 - [Crypto Zombies](https://cryptozombies.io/fr/)
 - [Maîtriser Ethereum](https://github.com/maitriser-ca/LivreMaitriserEthereum)
