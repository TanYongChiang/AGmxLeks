# AGmxLeks
Automate GROMACS

<h3>// DESCRIPTION <br/></h3>
<blockquote>Developed by: Tan (Alex) Yong Chiang (Sunway University, Malaysia) <br/>
GROMACS version tested: 2019 or newer <br/>
Usage: Protein-Ligand Complex Simulation <br/>
Please Acknowledge if it's helpful for you, thank you! <br/>
Based on the tutorial written by Justin Lemkul: <br/>
http://www.mdtutorials.com/gmx/complex/index.html <br/></blockquote>

<h3>// REQUIREMENT <br/></h3>
<blockquote>	
	OS Environment: Linux <br/>
	Packages: GROMACS 2019 or newer <br/>
						XMGrace <br/>
</blockquote>

<h3>// PREPARE <br/></h3>
<blockquote>	MDP files: NVT, NPT, MD, IONS, EM	<br/> </blockquote>

<h3>// UPDATES <br/></h3>
<blockquote>	
	27/10/2020- Automation starts from energy minimization step: <br/>
								>> gmx grompp -f em.mdp -c solv_ions.gro -p topol.top -o em.tpr <br/>
							To Molecular Dynamics production: <br/>
								>> gmx mdrun -deffnm md_0_10 <br/>
</blockquote>
