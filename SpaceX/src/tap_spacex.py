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


def fetch_rockets():
    url = 'https://api.spacexdata.com/v4/rockets'
    
    df = pd.read_json(url)
    df = df[['id', 'name', 'first_flight', 'cost_per_launch',
             'country','success_rate_pct', 'active'
             ]]
  
    records = df.to_dict(orient='records')
    
    schema = {
    'properties': {
        'id': {'type': 'string'},
        'name': {'type': 'string'},
        'first_flight': {'type': 'string', 'format': 'date-time'},
        'cost_per_launch': {'type': 'integer'},
        'country': {'type': 'string'},
        'success_rate_pct' : {'type': 'integer'},
        'active': {'type': 'boolean'}
    }
    
}
  
    singer.write_schema('rockets', schema, 'id')
    singer.write_records('rockets', records)

if __name__ == '__main__':
    fetch_launches()
    fetch_rockets()