#!/bin/sh

id=`finger -l $USER | grep Name | awk '{print $NF}'`

#grep "export PS1=\"\$name\ \\\w\$ \"" setup.sh

name=${1:-$id}
export PS1="$name \\w $ "
alias interact='qlogin -l h_vmem=2G'

#if ! egrep -q "export PS1 = ${PS1}$" ~/.bash_profile
#then
#    echo baileythegreen >> ~/.bash_profile
#else
#    sed -ie "s/baileythegreen//" ~/.bash_profile
#fi

function interactive() {
  qlogin -l h_vmem=${1:-2}G
  export PS1="$name \w$ "
}

function get_stuff() {
    cp -r ./shell-novice/data-shell ~
}
#git clone http://github.com/swcarpentry/shell-novice ${1:-~}/shell-novice
#unzip -f ${1:-~}/shell-novice/data/data-shell.zip

#if ! egrep -q ^baileythegreen$ ~/.bash_profile ; then echo baileythegreen >> ~/.bash_profile; else  sed -ie "s/baileythegreen//" ~/.bash_profile; fi



function prompt() {
        echo export PS1=\"$name \\w $ \" \#§§§§§§ >> ~/.bash_profile
}

function unprompt() {
        sed -ie "/^export PS1=\".* \$ \" \#\§\§\§\§\§\§$/d" ~/.bash_profile
}
(base) [ggrimes2@login02(eddie) bailey]$ cat /exports/igmm/eddie/public/bailey/setup.sh
#!/bin/sh

id=`finger -l $USER | grep Name | awk '{print $NF}'`

#grep "export PS1=\"\$name\ \\\w\$ \"" setup.sh

name=${1:-$id}
export PS1="$name \\w $ "
alias interact='qlogin -l h_vmem=2G'

#if ! egrep -q "export PS1 = ${PS1}$" ~/.bash_profile
#then
#    echo baileythegreen >> ~/.bash_profile
#else
#    sed -ie "s/baileythegreen//" ~/.bash_profile
#fi

function interactive() {
  qlogin -l h_vmem=${1:-2}G
  export PS1="$name \w$ "
}

function get_stuff() {
    cp -r ./shell-novice/data-shell ~
}
#git clone http://github.com/swcarpentry/shell-novice ${1:-~}/shell-novice
#unzip -f ${1:-~}/shell-novice/data/data-shell.zip

#if ! egrep -q ^baileythegreen$ ~/.bash_profile ; then echo baileythegreen >> ~/.bash_profile; else  sed -ie "s/baileythegreen//" ~/.bash_profile; fi



function prompt() {
        echo export PS1=\"$name \\w $ \" \#§§§§§§ >> ~/.bash_profile
}

function unprompt() {
        sed -ie "/^export PS1=\".* \$ \" \#\§\§\§\§\§\§$/d" ~/.bash_profile
}
