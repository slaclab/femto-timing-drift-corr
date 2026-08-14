#!/bin/bash
# As there is no iocBoot directory for the timing python codes,
# we end up running this with IOC set to the name and
# HUTCH set to the lowercase hutch name
# py-fstiming-XXX, py-fstiming-tt-XXX, py-fstiming-pcav-XXX are py2.7
# py-fstiming-cast-XXX is py3
hutch=`echo $IOC | awk -F- '{print $NF;}' -`
base=`basename $IOC -$hutch`

export PSPKG_ROOT=/reg/g/pcds/pkg_mgr
export PSPKG_RELEASE="las-0.0.2"
export EPICS_CA_MAX_ARRAY_BYTES=8000000
source ${PSPKG_ROOT}/etc/set_env.sh

echo "* Starting up, base=${base}"

echo "$hutch"

case $base in
   py-fstiming-tt)
      source /reg/g/pcds/setup/epicsenv-3.14.12.sh
      source /cds/group/pcds/pyps/conda/pcds_conda
      python -V
      script=Drift_Correction.py
      export MPLCONFIGDIR=/reg/d/iocData/fstiming-tt
      ;;
   *)
      echo "Bad IOC name: $IOC"
         while true; do sleep 3600; done     
         # Loop forever so we don't spam the log!
      ;;
esac

echo "Running script $script hutch $hutch"
