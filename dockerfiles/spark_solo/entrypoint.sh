# Entrypoint para iniciar Master ou Worker com base na variável de ambiente SPARK_MODE
ENTRYPOINT ["/bin/bash", "-c", \
    "if [ \"$SPARK_MODE\" == \"master\" ]; then \
        echo \"Starting Spark Master\"; \
        ./sbin/start-master.sh -h $(hostname -i) -p 7077; \

    elif [ \"$SPARK_MODE\" == \"worker\" ]; then \
        echo \"Starting Spark Worker connecting to $SPARK_MASTER_URL\"; \
        ./sbin/start-worker.sh $SPARK_MASTER_URL; \

    else \
        echo \"SPARK_MODE environment variable not set or invalid. Use 'master' or 'worker'.\"; \
    fi" \
]
