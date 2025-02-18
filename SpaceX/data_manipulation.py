import pandas as pd

data = {
    'rocket': [
        'Falcon 1',
        'Falcon 9',
        'Falcon Heavy'
    ],
    'launches': [5, 100, 3]
}

df = pd.DataFrame(data)
print(df)
print('-------------------')

# Rocket column selecting
print(df['rocket'])
print('-------------------')

rockets_more_than_five_launches = df[df['launches'] > 5]
print(rockets_more_than_five_launches)
print('-------------------')

df['success_rate'] = [0.4, 0.98, 1.0]
print(df)