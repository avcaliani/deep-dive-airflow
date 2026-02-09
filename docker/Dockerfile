# DockerHub: https://hub.docker.com/r/apache/airflow
FROM apache/airflow:3.1.7-python3.13

# [Decision]
# Instead of changing the airflow.cfg file directly, we can set environment 
# variables that will override the default configuration values.
# For a production setup, it's better to create custom "airflow.cfg" files.
# Ref: https://airflow.apache.org/docs/apache-airflow/stable/howto/set-config.html

# [Customizations]
# Airflow Home: /opt/airflow/
ENV AIRFLOW_VAR_LAKE_PATH="/data"
ENV AIRFLOW_VAR_APP_PATH="/opt/app/scripts"

# I did that 👇 to remove the Web App authentication 😅
ENV AIRFLOW__CORE__SIMPLE_AUTH_MANAGER_ALL_ADMINS="True"
ENV AIRFLOW__WEBSERVER__DEFAULT_LANGUAGE="en"

# Airflow Logs 💡
# Can be used in a ELK Stack for monitoring and alerting!
ENV AIRFLOW__LOGGING__BASE_LOG_FOLDER="$AIRFLOW_VAR_LAKE_PATH/logs"

CMD ["standalone"]
