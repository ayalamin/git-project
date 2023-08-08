#!/bin/bash
i=$1
if [[ $i < 1 || $i > 6 ]]; then 
echo "Number is not valid---enter in range 1-6"
exit 1
fi
echo "output is:" "${*:2}"
cd ..
./Exercise_$i/ex${i}.sh "${@:2}"

