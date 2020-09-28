# Introduction to Conda


## What you will learn

* What [conda](https://docs.conda.io/projects/conda/en/latest/index.html) is.
* How to load the conda package on [eddie](https://www.ed.ac.uk/information-services/research-support/research-computing/ecdf/high-performance-computing)
  - ```module load anacoda anaconda/5.3.1```
* Setting up conda variables on eddie,
  - conda [config --add](https://docs.conda.io/projects/conda/en/latest/commands/config.html)
  - envs_dirs
  - pkgs_dirs
* Creating, removing an conda environment
  - conda [create](https://docs.conda.io/projects/conda/en/latest/commands/create.html)
  - remove [remove](https://docs.conda.io/projects/conda/en/latest/commands/remove.html)
* Adding packages to a conda environment,
  - conda [install](https://docs.conda.io/projects/conda/en/latest/commands/install.html)
* Searching for packages, conda [search](https://docs.conda.io/projects/conda/en/latest/commands/search.html)
* conda [channels](https://docs.conda.io/projects/conda/en/latest/user-guide/concepts/channels.html#:~:text=Conda%20channels%20are%20the%20locations,to%20directories%20containing%20conda%20packages.)


# Anaconda on Eddie

[Anaconda on Eddie](https://www.wiki.ed.ac.uk/pages/viewpage.action?spaceKey=ResearchServices&title=Anaconda)




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
