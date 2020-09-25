# Introduction to Conda


## What you will learn

* What conda is
* How to load the conda package on eddie
* Setting up conda parameters on eddie, envs_dirs and pkgs_dirs variables
* Creating, removing an conda envirnoment
* Adding packages to a conda envirnoment
* Search for packages
* conda channels


# Anaconda on Eddie

https://www.wiki.ed.ac.uk/pages/viewpage.action?spaceKey=ResearchServices&title=Anaconda




## Log into Eddie

```
module load anaconda/5.3.1


##log into worker node
qlogin -l h_vmem=8G

#move to your scratch directory
cd /exports/eddie/scratch/${USER}

# load anaconda
module load anaconda/5.3.1

# set envs_dirs & pkgs_dirs
conda config --add envs_dirs /exports/eddie/scratch/${USER}/envs_dirs
conda config --add pkgs_dirs /exports/eddie/scratch/${USER}/pkgs_dirs
```


# Useful Links

* [conda website](https://docs.conda.io/en/latest/)
* [conda cheatsheet](https://docs.conda.io/projects/conda/en/latest/user-guide/cheatsheet.html)
* https://www.wiki.ed.ac.uk/pages/viewpage.action?spaceKey=ResearchServices&title=Anaconda
* [carpentry course](https://carpentries-incubator.github.io/introduction-to-conda-for-data-scientists/)

* [youtube video](https://www.youtube.com/watch?v=23aQdrS58e0&ab_channel=Academind)
