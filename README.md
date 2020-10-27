# AGmxLeks
Automate GROMACS

// DESCRIPTION
  Developed by: Tan (Alex) Yong Chiang (Sunway University, Malaysia)
  GROMACS version tested: 2019 or newer
  Usage: Protein-Ligand Complex Simulation
  Please Acknowledge if it's helpful for you, thank you!
  Based on the tutorial written by Justin Lemkul:
    http://www.mdtutorials.com/gmx/complex/index.html
// END DESCRIPTION

// REQUIREMENT
  OS Environment: Linux
  Packages: GROMACS 2019 or newer
            XMGrace
// END REQUIREMENT

// PREPARE
  MDP files: NVT, NPT, MD, IONS, EM
// END PREPARE

// UPDATES
  27/10/2020- Automation starts from energy minimization step:
                >> gmx grompp -f em.mdp -c solv_ions.gro -p topol.top -o em.tpr
              To Molecular Dynamics production:
                >> gmx mdrun -deffnm md_0_10
// END UPDATES
