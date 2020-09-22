#Make sure qlogged or use wild west node

qlogin -l h_vmem=16G
ssh -X node3g22




#Managing environments
# Conda allows you to create separate environments containing files, packages, 
# 
# and their dependencies that will not interact with other environments.
# 
# When you begin using conda, you already have a default environment named base. 
# You don't want to put programs into your base environment, though. 
#Create separate environments to keep your programs isolated from each other.

#Create a new environment and install a package in it.
# There are 2 ways --name will install in envs_dirs 

conda create --name my_first_conda_env
#will create envirnoment in envs_dirs

#prefix custom location
conda create --prefix  ./my_first_conda_env


# Specifying a path to a subdirectory of your project directory when creating an environment has the following benefits:
#
# It makes it easy to tell if your project uses an isolated environment by including the environment as a subdirectory.
# 
# It makes your project more self-contained as everything, including the required software, is contained in a single project directory.
# 
# An additional benefit of creating your project’s environment inside a subdirectory 
#is that you can then use the same name for all your environments. 
#If you keep all of your environments in your envs folder, 
#you’ll have to give each environment a different name.

# #There are a few things to be aware of when placing conda environments outside of the default envs folder.
# 
# Conda can no longer find your environment with the --name flag. 
#You’ll generally need to pass the --prefix flag along with the environment’s full path to find the environment.
# 
# Specifying an install path when creating your conda environments makes it so that your command prompt is n
# now prefixed with the active environment’s absolute path rather than the environment’s name.
# 
# After activating an environment using its prefix, your prompt will look similar to the following:

#You can list all discoverable environments with `conda info --envs`.

conda activate ../my_first_conda_env
#show bin dir add to path
echo $PATH


#talk about envirnoment  prompt to be smaller (like unix PS1 (Prompt String 1)  envirnoment varibale)
conda config --describe env_prompt 
conda config --set env_prompt '({name}) '


# list packages in current envirnoment
conda list

# Try and install bedtools

# install another rpackage
conda search bedtools

#can't find it

# best way to search is use anaconda cloud
# see channels it's in and download count. 
#show https://anaconda.org/
#conda config --get channels
# This show it's in the bioconda channel

#search for it
conda search -c bioconda bedtools

conda config --add/append channels bioconda

conda config --show channels

#different version avialable

#semantic versioning
conda install -c bioconda bedtools #install latest version


conda list


#highlight downgraded bit and latest version 0.2
#It is always best to specify the version you want to speed up solvig environent
conda install -c bioconda  bedtools=2.26

#

conda list --revisions


#If you want to revert to a previous revision you can simply run conda install --revision N 
conda install --revision 1 

#a full history can be found in 
cat beegee/conda-meta/history

#http://blog.rtwilson.com/conda-revisions-letting-you-rollback-to-a-previous-version-of-your-environment/

#if you want to update to latest version
conda update -c bioconda bedtools



#Share your envirnoment
#You may want to share your environment with someone else---for example, 

#so they can re-create a test that you have done. 
#To allow them to quickly reproduce your environment, with all of its packages and versions, 
#give them a copy of your environment.yml file.

conda list --explicit > env.txt

conda create --prefix my_second_conda_env --file env.txt


#Exporting an environment file across platforms
#If you want to make your environment file work across platforms, 
#you can use the 

conda env export > environment.yml

# then you can use 

conda env create --prefix my_third_conda_env --file environment.yml

#Creating an environment file manually
#You can create an environment file (environment.yml) manually to share with others.
# This is recommended if you want it ot be cross platform

#EXAMPLE: A simple environment file:

#YA simplier way to do this for yourself is to make an exact copy of an environment by creating a clone of it:

conda create --prefix ./my_fourth_conda_env --clone ./my_first_conda_env

# Removing an environment

#To remove an environment, in your terminal window or an Anaconda Prompt, run:

conda remove --prefix ./maurice --all

#You may instead use 

conda env remove --prefix ./my_first_conda_env

##To verify that the environment was removed, in your terminal window or an Anaconda Prompt, run:

##conda info --envs --prefix 



# Updating an environment (Updates conda packages to the latest ***compatible*** version.)
# You may need to update your environment for a variety of reasons. For example, it may be the case that:
# 
# one of your core dependencies just released a new version (dependency version number update).
# 
# you need an additional package for data analysis (add a new dependency).
# 
# you have found a better package and no longer need the older package (add new dependency and remove old dependency).
# 
# If any of these occur, all you need to do is update the contents of your environment.yml file accordingly and then run the following command

#make sure in the envirnoment
#Closely related to installing a particular version of a conda package is 
#updating the installed version to the latest version possible that remains compatible with other installed software.
#conda will determine if it is possible to update dependencies of the package(s) you are directly updating, and do so if resolvable. 
#At times, the single specified package will be updated exclusively since the current dependencies are correct for the new version. 
#Obviously, at other times updating will do nothing because you are already at the latest version possible.
#The command conda update PKGNAME is used to perform updates. 
#Update is somewhat less "aggressive" than install in the sense that installing a specific (later) version 
#will revise the versions in the dependency tree to a greater extent than an update. 
#Often update will simply choose a later PATCH version even though potentially a later MAJOR or MINOR version 
#could be made compatible with other installed packages.


conda update -c bioconda bedtools





#cleaning up
# Conda stores downloaded package tar balls in pkgs_dirs dir this can become large
# use


conda clean -a --dry-run




## Solving environment
# show slides





####
#Nested activation
#By default, conda activate will deactivate the current environment before activating 
#the new environment and reactivate it when deactivating the new environment. 
#Sometimes you may want to leave the current environment PATH entries in place so 
#that you can continue to easily access command-line programs from the first environment. 
#This is most commonly encountered when common command-line utilities are installed in the base environment.
#To retain the current environment in the PATH, you can activate the new environment using:

conda activate --stack myenv

#If you wish to always stack when going from the outermost environment, which is typically the base environment, 
#you can set the auto_stack configuration option:

conda config --set auto_stack 1
