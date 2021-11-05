#!/usr/bin/env bash

co2_arr=(0.75 0.8 0.85 0.9 0.95 1)

temp="Temp.ipynb"

# Create folder for generated notebooks
notebook_folder="./notebooks"
mkdir -p "$notebook_folder"

# Generate notebooks
for i in "${co2_arr[@]}"
do
	echo "> Processing co2 reduction $i"
	echo "> Creating temp notebook ..."
	cp "Multi-regional_Energy_System_Workflow.ipynb" "$temp"
  sed -i "s/\"CO2_reductionTarget = .*\"/\"CO2_reductionTarget = $i\"/g" "$temp"

  echo "> Run temp notebook ..."
  jupyter nbconvert --to notebook --inplace --execute "$temp"

  echo "> Copy temp notebook to /notebooks"
	notebook="$notebook_folder/CO2_reduction_$i.ipynb"
	cp "$temp" "$notebook"
done

rm "$temp"
echo "> Done "