#!/bin/bash
COMPILER=$1

CORES=`ls src/ | grep "core_" | sed "s/core_//g"`

module load mpas
rm -f .builds build_log

for CORE in ${CORES}
do
	make report_builds CORE=${CORE} > .builds
	LINES=`wc -l .builds | awk '{print $1}'`

	for LINE in `seq 1 ${LINES}`
	do
		echo "PWD is: $PWD"
		BUILD=`awk "NR==${LINE}" .builds`
		echo "Trying make ${COMPILER} ${BUILD}"

		make ${COMPILER} ${BUILD} &> build_log

		EXE=`cat build_log | grep " EXE_NAME=" | sed "s/ //g" | sed "s/EXE_NAME=//g" | sed 's/"//g' | head -n 1`

		if [ -e ${EXE} ] && [ "${EXE}" != "" ] ; then
			SUCCESS=1
		else
			SUCCESS=0
		fi

		if [ "${SUCCESS}" == "1" ]; then
			echo "${BUILD} passed"
		else
			echo " ** ${BUILD} failed ** "
			exit
		fi

		make clean ${BUILD} &> /dev/null
		rm build_log
	done
	rm .builds
	rm -f namelist* stream*
done

