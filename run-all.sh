#!/usr/bin/env bash

co2_arr=(0.75 0.8 0.85 0.9 0.95 1)

create_notebook() {
  cp "$1" "$2"
  sed -i "s/\"CO2_reductionTarget = .*\"/\"CO2_reductionTarget = $3\"/g" "$2"
}


for i in "${co2_arr[@]}"
do
	echo "> Processing co2 reduction $i"
	notebook="notebooks/CO2_reduction_$((100 * i))_percent.ipynb"
	echo "> Creating notebook $notebook ..."
	create_notebook "Multi-regional_Energy_System_Workflow.ipynb" "$notebook" "$i"
	echo "> Executing notebook $notebook ..."
	jupyter nbconvert --to notebook --execute "$notebook"
	echo "> Done"
done