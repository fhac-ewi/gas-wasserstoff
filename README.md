# Gas- und Wasserstoff
Energiesystemmodell mit FINE im Modul Gas und Wasserstoffversorgungsstrukturen WS2021/22. The documentation can be 
found [here](https://github.com/fhac-ewi/gas-wasserstoff-docs).

## Installation
This project works only with [Anaconda](https://www.anaconda.com/products/individual) on Windows.

```shell
conda create -n gw_env
conda activate gw_env
conda config --env --add channels conda-forge
conda config --env --set channel_priority strict
conda install python=3.7 geopandas jupyter numpy pandas scipy xlsxwriter
pip install fine
```

When using PyCharm you need to add the environment manually.
Navigate to the **Settings** menu and select **Project Settings**. Go to python interpreter and select **Add**. 
Select Conda environment and click add existing environment. Select gw_env from the list.

For the example script you need the [Gurobi solver](https://www.gurobi.com/) installed on your system. You can 
create an academic license [here](https://www.gurobi.com/academia/academic-program-and-licenses/). After 
registration follow the installation instructions on Gurobi website. You might need to reboot your system.

## Usage
Run/Modify the notebook `Multi-regional_Energy_System_Workflow.ipynb`. It uses the `getData.py` to retrieve example 
data from `./InputData`. (These were provided as 
[example from FINE project](https://github.com/FZJ-IEK3-VSA/FINE/tree/master/examples/Multi-regional_Energy_System_Workflow).) 

In order to duplicate the notebook for each CO2_reduction open a terminal and run the following command:
```shell
sh run-all.sh
```
It will execute the notebook for each CO2_reduction and write the results to `./results`.

## Aufgabenstellung
Entwicklung eines Modells auf Basis des Framework FINE zur Optimierung eines nationalen Energiesystems zur Versorgung von Wasserstoff auf Basis von erneuerbarem Strom.
Ziel: Gesamtsystemoptimierung des Energiesystems inklusive Strom- und Gasinfrastrukturen unter Beachtung von CO2-Reduktionen für das Jahr 2050.

**Modellaufbau**

| Komponente | Design |
| ---------- | ------ |
| EE-Erzeugung | Wind Onshore, Wind Offshore, PV |
| Stromnetz AC | Ja |
| Stromnetz DC | Ja |
| H2-Pipeline | Ja |
| Endenergiebedarf | Strom und H2 |

Führen Sie das Modell nun mit verschiedenen CO2-Beschränkungen aus. Innerhalb der Gruppe rechnet jedes Gruppenmitglied jeweils eine CO2-Beschränkung im Vergleich zu 1990 366 Mio. t CO2) aus: 
- -75 % 
- -80 % 
- -85 % 
- -90 % 
- -95 % 
- -100 % 


Dieses Projekt entstand auf Basis des Beispiels
https://github.com/FZJ-IEK3-VSA/FINE/tree/master/examples/Multi-regional_Energy_System_Workflow
von dem Projekt FINE!