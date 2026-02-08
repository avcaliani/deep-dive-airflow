# DockerHub
# https://hub.docker.com/r/apache/airflow
FROM apache/airflow:3.1.7-python3.13

# [Decision]
# Instead of changing the airflow.cfg file directly,
# we can set environment variables that will override
# the default configuration values.
#
# For a production setup, it's better to create custom "airflow.cfg" files.

# [Customizations]
ENV LAKE_PATH="/data"      
# I did that 👇 to remove the Web App authentication 😅
ENV AIRFLOW__CORE__SIMPLE_AUTH_MANAGER_ALL_ADMINS="True"
ENV AIRFLOW__WEBSERVER__DEFAULT_LANGUAGE="en"
ENV AIRFLOW__LOGGING__BASE_LOG_FOLDER="$LAKE_PATH/logs"

CMD ["standalone"]
