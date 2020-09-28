# source ~/.bashrc

# first time setup
# log into Eddie
# ssh <username>@eddie.ecdf.ed.ac.uk
# load anaconda
module load anaconda/5.3.1

#if you don't want conda onstartup
#https://stackoverflow.com/questions/54429210/how-do-i-prevent-conda-from-activating-the-base-environment-by-default
#conda config --set auto_activate_base false
#then you would run 'conda activate' to activate base

## very important!
##log into worker node
qlogin -l h_vmem=8G

#move to your scratch directory
#this will be deleted periodically so copy data off after you have finished
cd /exports/eddie/scratch/${USER}

# load anaconda
module load anaconda/5.3.1

# set envs_dirs & pkgs_dirs
conda config --add envs_dirs /exports/eddie/scratch/${USER}/envs_dirs
conda config --add pkgs_dirs /exports/eddie/scratch/${USER}/pkgs_dirs

#show wich version of conda you are using
which conda

# Display information about current conda install.
conda info

#list conda envirnoments
conda env list

# Managing environments
# Conda allows you to create separate environments containing files, packages,
# and their dependencies that will not interact with other environments.
#
# When you begin using conda, you already have a default environment named base.
# You don't want to put programs into your base environment, though.
# Create separate environments to keep your programs isolated from each other.

# Create a new environment and install a package in it.
# There are 2 ways --name will install in envs_dirs

conda create --name my_first_named_conda_env
# will create envirnoment in envs_dirs

#To activate this environment, use
#
 conda activate my_first_named_conda_env

# let's get out of environment
conda deactivate

# prefix custom location
conda create --prefix  ./my_first_conda_env


# Specifying a path to a subdirectory of your project directory
# when creating an environment has the following benefits:
#
# It makes it easy to tell if your project uses an isolated environment
# by including the environment as a subdirectory.
#
# It makes your project more self-contained as everything,
#  including the required software, is contained in a single project directory.
#
# An additional benefit of creating your project’s environment inside a subdirectory
# is that you can then use the same name for all your environments.
#
# If you keep all of your environments in your envs folder,
# you’ll have to give each environment a different name.

# #There are a few things to be aware of when placing conda environments outside of the default envs folder.
#
# Conda can no longer find your environment with the --name flag.
# You’ll generally need to pass the --prefix flag along with the environment’s full path to find the environment.
#
# Specifying an install path when creating your conda environments makes it so that your command prompt is
# now prefixed with the active environment’s absolute path rather than the environment’s name.
#
# You can list all discoverable environments with `conda info --envs`.

conda activate ./my_first_conda_env
#activate env
conda activate /exports/eddie/scratch/${USER}/my_first_conda_env
#show bin dir add to path
echo $PATH


#talk about setting environment prompt to be smaller (like unix PS1 (Prompt String 1)  environment varibale)
conda config --describe env_prompt
conda config --set env_prompt '({name}) '
cat ~/.condarc
#to get back
#conda config --set env_prompt '({default_env})'

conda deactivate
#smaller prompt
conda activate /exports/eddie/scratch/${USER}/my_first_conda_env

# list conda environments
conda env
#another way
conda info --envs

# list packages (software) in current environment
conda list

#  Search for packages and display associated information. The
#  input is a MatchSpec, a query language for conda packages.
#  See examples below.
conda search tree


#can't find it

# best way to search is use anaconda cloud
# see channels it's in and download count.
# show https://anaconda.org/

#this shows tree is in the conda-forge channel

# channels
# channel websites which packages may be installed
# conda config --get channels

#search for it
conda install -c conda-forge tree

#make sure it location
which tree
which -a tree

tree my_first_conda_env

# we can add channels using conda config command
# conda config --add/append/remove/show
conda config --help

#Add the conda channel
conda config --add channels conda-forge
#seee that it has been added
conda config --show channels


#Add the 'conda-forge' channel as a backup to 'defaults':
conda config --append channels conda-forge

#Let try a bioinformatics package bedtools
#https://anaconda.org/search?q=bedtools

# back to search
conda search -c bioconda bedtools

#Add the 'bioconda' channel as at bottom
conda config --append channels bioconda

conda config --show channels

# different version avialable
# https://en.wikipedia.org/wiki/Software_versioning
# semantic versioning
conda install -c bioconda bedtools            #install latest version
#conda install -c bioconda bedtools=2.29.2    #specific version major.minor.patch
#conda install -c bioconda bedtools=2.27      #latest minor
#conda install -c bioconda bedtools=2.27.0    #specific version
#conda install -c bioconda bedtools

conda list


# highlight downgraded bit and latest version 0.2
# It is always best to specify the version you want to speed up solving
# environment
conda install -c bioconda  bedtools=2.26

# show revision history
conda list --revisions


#If you want to revert to a previous revision you can simply run conda install --revision N
conda install --revision 2

#a full history can be found in
cat my_first_conda_env/conda-meta/history

#http://blog.rtwilson.com/conda-revisions-letting-you-rollback-to-a-previous-version-of-your-environment/

#if you want to update to latest version
conda update -c bioconda bedtools



# Share your environment
# You may want to share your environment with someone else---for example,

# so they can re-create a test that you have done.
# To allow them to quickly reproduce your environment, with all of its packages and versions,
# give them a copy of your environment.yml file.
conda list --explicit

#save to file
conda list --explicit > env.txt

conda create --prefix my_second_conda_env --file env.txt
conda activate ./my_second_conda_env
conda deactivate

# Exporting an environment file across platforms
# If you want to make your environment file work across platforms,
# you can use the "conda env" not just conda
conda env export
conda env export > environment.yml

# then you can use

conda env create --prefix my_third_conda_env --file environment.yml
conda activate /exports/eddie/scratch/${USER}/my_third_conda_env
#show packages are installed
conda list
#retuirn to first env
conda deactivate

# Creating an environment file manually
# You can create an environment file (environment.yml)
# manually to share with others.
# This is recommended if you want it to be cross platform

# EXAMPLE: A simple environment file:

# A simplier way to do this for yourself is to make an
# exact copy of an environment by creating a clone of it:

conda create --prefix ./my_fourth_conda_env --clone ./my_first_conda_env
conda activate /exports/eddie/scratch/${USER}/my_fourth_conda_env
# Removing an environment

#To remove an environment, in your terminal window or an Anaconda Prompt, run:

conda remove --prefix ./my_first_conda_env --all

# You may instead use

conda env remove --prefix ./my_second_conda_env
#remaning third and fourth envs


# Cleaning up
# remove unused packages and caches.
# Conda stores downloaded package tar balls in pkgs_dirs dir this can become large
conda clean --help
ls pkgs_dirs
du -sh pkgs_dirs
# use

#dry-run
conda clean -a --dry-run
conda clean -a

ls pkgs_dirs
du -sh pkgs_dirs

#for snakemake part of the course
git clone https://git.ecdf.ed.ac.uk/ltalmane/snakemaketut.git
cd snakemaketut

#The -f and --file options do the same thing.
conda env create –f environment.yml
conda activate snakeTut

#using mamba
#the first mamba is the environment name, the second the package to load
conda create -n mamba mamba
