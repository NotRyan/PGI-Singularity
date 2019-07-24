#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "USAGE: create_pgi_links <singularity image location>"
    echo "Creates a folder 'bin' in the current directory which will contain a number of bash scripts that execute a command to the singularity image specified, for ease of use."
    exit
fi
SING_LOC=$(realpath $1)
PGI_BIN_LOC=/opt/pgi/linux86-64/19.4/bin
#CMD=$(echo $0 | sed s/^[^[:space:]]*\\///)

mkdir bin
echo -e "#!/bin/bash\nCMD=\$(echo \$0 | sed 's/^[^[:space:]]*\\///')\nsingularity exec $SING_LOC $PGI_BIN_LOC/\$CMD \$@" | tee bin/pgf77 bin/pgfortran bin/pgcc bin/pgc++ bin/pgdbg bin/pgprof
chmod +x bin/pgf77 bin/pgfortran bin/pgcc bin/pgc++ bin/pgdbg bin/pgprof bin/pgf90

