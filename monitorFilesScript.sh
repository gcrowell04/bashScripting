####   Script to automate Mongo DB work ####

## Setup steps:
# 1. Modify script name to match names of the scripts you are running.
# 2. Change to your home directory and create a processed directory.
# 3. Drop files to run inside of your home directory and run the script.


        clear;
        while true;
                clear;
                do echo "Thread count:";
                 tc="$(ps -ef | grep engine | grep -v bash | grep -v grep | wc -l)";
                 echo $tc;
                 end=4;
                if [[ $tc -lt $end ]];  then
                        # Grab one file for processing
                        file_to_run=$(find . -name "FILENAME.js" -not -path "./processed/*" -print -quit); 
                        echo "Thread Finished. Starting new file...";
                        echo $file_to_run;
                        nohup <PROCESSING_SCRIPT> $file_to_run &
                        # Wait for connection to DB before moving input file
                        sleep 5;
                        mv <HOME_DIR> <PROCESSED_DIR>;
                else

                 #echo "File output:";
                 ps -ef --sort=start_time | grep engine | grep -v bash | grep -v grep;
                 #tail -n 10 $(ls *js.out-prod-$(date +%m-%d-%Y));
                 sleep 25;
                fi
         done
