        clear;
        while true;
                do echo "Thread count:";
                 tc = ps -ef | grep engine | grep -v bash | grep -v grep | wc -l;

                if [$tc < 6];  then
                        file_to_run=$(find . -name "*.js" -quit);
                        echo "Thread Finished. Starting new file";
                        echo $file_to_run;
                        nohup <script_name> $file_to_run &
                        mv /home/$(LOGNAME)/$file_to_run /home/$(LOGNAME)/processed
                else
                    echo "6 active threads"
                fi
                 echo "File output:";
                 ps -ef --sort=start_time | grep engine | grep -v bash | grep -v grep;
                 tail -n 10 $(ls *js.out-prod-$(date +%m-%d-%Y));
                 sleep 25;
         done
