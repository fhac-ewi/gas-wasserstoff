#!/usr/bin/env bash

co2_arr=(0.0 0.75 0.8 0.85 0.9 0.95 1)


# Clear results, notebooks and images folder
rm -rf "./results"
rm -rf "./notebooks"
rm -rf "./images"

# Create folder for generated notebooks
notebook_folder="./notebooks"
mkdir -p "$notebook_folder"


# Generate notebooks
for i in "${co2_arr[@]}"
do
	echo "> Processing co2 reduction $i"
	echo "> Creating temp notebook ..."
	temp="CO2_reduction_$i.ipynb"
	cp "Multi-regional_Energy_System_Workflow.ipynb" "$temp"
  sed -i "s/\"CO2_reductionTarget = .*\"/\"CO2_reductionTarget = $i\"/g" "$temp"

  echo "> Run notebook $temp ..."
  jupyter nbconvert --to notebook --inplace --execute "$temp"

  echo "> Copy temp notebook to /notebooks"
	final_notebook="$notebook_folder/CO2_reduction_$i.ipynb"
	cp "$temp" "$final_notebook"
	rm "$temp"
done

echo "> Done "