import logging

from azure.functions import TimerRequest
from datetime import datetime, timezone


import datetime
import logging
import os
import requests
import azure.functions as func


def main(mytimer: func.TimerRequest) -> None:
    logging.info('Bexio Timer function started at %s', datetime.datetime.utcnow())

    # read token
    bexio_token = os.getenv("BEXIO_TOKEN")
    if not bexio_token:
        logging.error("BEXIO_TOKEN not found in environment.")
        return

    url = "https://api.bexio.com/2.0/accounting/manual_entries"
    headers = {
        "Authorization": f"Bearer {bexio_token}",
        "Accept": "application/json"
    }

    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        data = response.json()
        logging.info(f"Received {len(data)} entries from Bexio.")
    except requests.exceptions.RequestException as e:
        logging.error(f"Error while calling Bexio API: {e}")
