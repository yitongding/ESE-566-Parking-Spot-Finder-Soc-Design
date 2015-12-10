#!/bin/sh

DATE=`date`
mv -f runtest.log runtest.log.temp
echo "+------------------------------------+"  > runtest.log
echo "|    Summary of all Results          |" >> runtest.log
echo "| ${DATE} |"                >> runtest.log
echo "+------------------------------------+" >> runtest.log
echo "" >> runtest.log


if [ -f testlist ]; then
  for test in `cat testlist`
  do
    if [ -f ${test}/test.result ]; then
      RESULT=`cat ${test}/test.result`
      echo "${test}" | awk '{printf("%-20s : %s\n", $1, RESULT)}' RESULT="${RESULT}" >> runtest.log
    fi
  done
else
  echo "ERROR: No testcases listed - this is not expected" >> runtest.log
fi

echo "" >> runtest.log
cp -f runtest.log emailSummary.log
cat runtest.log.temp >> runtest.log
rm -f runtest.log.temp

