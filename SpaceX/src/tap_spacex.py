import singer
import pandas as pd

LOGGER = singer.get_logger()



def fetch_launches():
    url = 'https://api.spacexdata.com/v4/launches'
    
    df = pd.read_json(url)
    df = df[['id', 'name', 'date_utc', 'success', 'rocket']]
    df['success'] = df['success'].apply(lambda x: True if x == 1.0 else False if x == 0.0 else 'No info')
    
    records = df.to_dict(orient='records')
    
    schema = {
    'properties': {
        'id': {'type': 'string'},
        'name': {'type': 'string'},
        'date_utc': {'type': 'string', 'format': 'date-time'},
        "success": {"type": ["number", "null"]},
        'rocket': {'type': 'string'}
    }
}
  
    singer.write_schema('launches', schema, 'id')
    singer.write_records('launches', records)


if __name__ == '__main__':
    fetch_launches()