#!/bin/bash

#main core from EM to MD simulation
function run_all {
	echo -e "$LIG starts on $(date)" > date.log
	gmx grompp -f em.mdp -c solv_ions.gro -p topol.top -o em.tpr
	#read -p "continue"
	gmx mdrun -v -deffnm em
	#read -p "continue"
	echo -e "0 & ! a H*\nq" | gmx make_ndx -f $LIG.gro -o index_$LIG.ndx
	#read -p "continue"
	echo -e "3" | gmx genrestr -f $LIG.gro -n index_$LIG.ndx -o posre_$LIG.itp -fc 1000 1000 1000
	#read -p "continue"
	mv topol.top topolbck1.top
	#read -p "continue"
	sed '/Include ligand topology/!{p;d;};n;n; s/$/ \n\; Ligand position restraints \n\#ifdef POSRES \n\#include \"posre_'"$LIG"'\.itp\" \n\#endif \n/' topolbck1.top > topol.top
	#read -p "continue"
	echo -e "1 | 13\nq" | gmx make_ndx -f em.gro -o index.ndx
	#read -p "continue"
	gmx grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -n index.ndx -o nvt.tpr
	gmx mdrun -deffnm nvt
	#read -p "continue"
	gmx grompp -f npt.mdp -c nvt.gro -t nvt.cpt -r nvt.gro -p topol.top -n index.ndx -o npt.tpr
	gmx mdrun -deffnm npt
	#read -p "continue"
	echo -e "11" | gmx energy -f em.edr -o potential.xvg
	echo -e "16" | gmx energy -f nvt.edr -o temperature.xvg
	echo -e "17" | gmx energy -f npt.edr -o pressure.xvg
	echo -e "23" | gmx energy -f npt.edr -o density.xvg
	grace -nxy potential.xvg -hdevice PNG -hardcopy -printfile potential.png
	grace -nxy temperature.xvg -hdevice PNG -hardcopy -printfile temperature.png
	grace -nxy pressure.xvg -hdevice PNG -hardcopy -printfile pressure.png
	grace -nxy density.xvg -hdevice PNG -hardcopy -printfile density.png
	#read -p "drawed graph"
	gmx grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -n index.ndx -o md_0_10.tpr
	gmx mdrun -deffnm md_0_10 
	#read -p "END"
	echo -e "$LIG ends on $(date)" >> date.log
}

#START
echo -e "Simulation starts on %(date)"
