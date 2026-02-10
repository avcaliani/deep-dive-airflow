from airflow.models import Variable
from airflow.providers.common.compat.sdk import TriggerRule
from airflow.sdk import dag, task
from pendulum import datetime, duration


@dag(
    schedule="*/10 * * * *",
    start_date=datetime(2026, 2, 1, tz="UTC"),
    catchup=False,
    dag_display_name="The Office Daily ETL 🏢",
    tags=["office", "etl", "daily"],
)
def the_office_daily_etl():
    """
    A daily ETL pipeline that simulates The Office daily activities.

    Observations:
        catchup=False / prevents backfilling historical runs when you deploy.
    """

    LAKE_PATH = Variable.get("LAKE_PATH")
    APP_PATH = Variable.get("APP_PATH")

    # Sequential Start
    @task.bash
    def morning_meeting():
        return "echo 'Morning meeting: everyone checks in ☕️'"

    @task.bash
    def generate_inventory():
        return f"{APP_PATH}/office/generate_inventory.sh {LAKE_PATH}"

    # Parallel Tasks
    @task.bash
    def generate_sales():
        return f"{APP_PATH}/office/generate_sales.sh {LAKE_PATH}"

    @task.bash(retries=2, retry_delay=duration(minutes=1))
    def prank_report():
        return f"{APP_PATH}/office/prank_report.sh {LAKE_PATH}"

    @task.bash(retries=1, retry_delay=duration(seconds=15))
    def security_check():
        return f"{APP_PATH}/office/security_check.sh {LAKE_PATH}"

    # Merge CSVs into a Daily Report
    @task.bash
    def merge_daily_report():
        return f"{APP_PATH}/office/merge_daily_report.sh {LAKE_PATH}"

    # Sunset Cleanup Task
    @task.bash(trigger_rule=TriggerRule.ALL_DONE)
    def office_cleanup():
        return f"{APP_PATH}/office/cleanup.sh {LAKE_PATH}"

    # DAG Dependencies
    (
        morning_meeting()
        >> generate_inventory()
        >> [generate_sales(), prank_report(), security_check()]
        >> merge_daily_report()
        >> office_cleanup()
    )


# Instantiate the DAG
the_office_daily_etl()
