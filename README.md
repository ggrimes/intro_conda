# Introduction to Conda


## What you will learn

* What [conda](https://docs.conda.io/projects/conda/en/latest/index.html) is.
* How to load the conda package on [eddie](https://www.ed.ac.uk/information-services/research-support/research-computing/ecdf/high-performance-computing)
* Setting up conda variables on eddie,
  - conda [config --add](https://docs.conda.io/projects/conda/en/latest/commands/config.html)
  - envs_dirs
  - pkgs_dirs
* Creating, updating and removing a conda environment
  - conda [create](https://docs.conda.io/projects/conda/en/latest/commands/create.html)
  - conda [remove](https://docs.conda.io/projects/conda/en/latest/commands/remove.html)
  - conda [update](https://docs.conda.io/projects/conda/en/latest/commands/update.html)
* Adding packages to a conda environment,
  - conda [install](https://docs.conda.io/projects/conda/en/latest/commands/install.html)
* Searching for packages,
  - conda [search](https://docs.conda.io/projects/conda/en/latest/commands/search.html)
  - [Search Anaconda cloud](https://anaconda.org/)
* conda [channels](https://docs.conda.io/projects/conda/en/latest/user-guide/concepts/channels.html#:~:text=Conda%20channels%20are%20the%20locations,to%20directories%20containing%20conda%20packages.)


# Setup


Some useful notes for [Anaconda on Eddie](https://www.wiki.ed.ac.uk/pages/viewpage.action?spaceKey=ResearchServices&title=Anaconda)

**Important is you already have a functioning version of conda (version > 4.8) on eddie you may skip these steps**


## Log into Eddie

~~~
#on head node
# load anaconda
module load igmm/apps/anaconda/2020.02
#If this is the first time using conda run
conda init

#source .bashrc
source ~/.bashrc


##log into worker node
qlogin -l h_vmem=8G

#load the conda module again
module load igmm/apps/anaconda/2020.02


#move to your scratch directory
cd /exports/eddie/scratch/${USER}
mkdir conda_tutorial
cd conda_tutorial


~~~

Configuration

~~~
# set envs_dirs & pkgs_dirs
conda config --add envs_dirs /exports/eddie/scratch/${USER}/conda_tutorial/envs_dirs
conda config --add pkgs_dirs /exports/igmm/eddie/carpentries/conda/pkgs_dirs


#check installation worked
conda info
~~~

# Course materials

https://edcarp.github.io/introduction-to-conda-for-data-scientists/

# Collaborative document

https://docs.google.com/document/d/1t66AseGhC7-v9t4qOBNB2pyFragLeSNq2JapARTnilU/edit?usp=sharing


# Slides
[google slides](https://docs.google.com/presentation/d/16LL23dTqJr9CmnGo2I8PPy6vmQhGFoRTfdndAeUOs18/edit?usp=sharing)


# Feedback survey

It is very important to capture feedback for this lesson. Please fill out the form below.

https://forms.gle/Bv1bkiQ6JJQ2bxdw5

# Useful Links

* [conda website](https://docs.conda.io/en/latest/)
* [conda cheatsheet](https://docs.conda.io/projects/conda/en/latest/user-guide/cheatsheet.html)
* [understanding-and-improving-condas-performance](https://www.anaconda.com/blog/understanding-and-improving-condas-performance)
* [Eddie Uoe Wiki on Anaconda](https://www.wiki.ed.ac.uk/pages/viewpage.action?spaceKey=ResearchServices&title=Anaconda)
* [youtube video](https://www.youtube.com/watch?v=23aQdrS58e0&ab_channel=Academind)
