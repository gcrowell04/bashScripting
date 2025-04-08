while true;
  do echo "Thread count:";
  ps -ef | grep <scriptName> | grep -v bash | grep -v grep | wc -l; ## active threadsCount
  ps -ef --sort=start_time | grep <scriptName> | grep -v bash | grep -v grep; # List scripts and sort by age
  echo "File output:";
  ps -ef --sort=start_time | grep <scriptName> | grep -v bash | grep -v grep;
  tail -n 10 $(ls *js.out-$(date +%m-%d-%Y)); ## Dynamically follow the output of files based on today's date
  sleep 25; ## wait for 25 seconds
done
