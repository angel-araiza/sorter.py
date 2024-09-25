import pandas as pd

# Load the Excel file
file_path = "denver_data.xlsx"
df = pd.read_excel(file_path, engine ='openpyxl')

mint_profile_id = df['Profile MINT ID']

for index, value in mint_profile_id.items():
  if pd.notna(value):
    print(f"Row {index}: {value}")

