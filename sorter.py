import pandas as pd

# Load the Excel file
file_path = "C:\Users\angel.araiza\Desktop\denver_project\denver_data.xlsx"
df = pd.read_excel(file_path, engine ='openpyxl')

mint_profile_id = df['Profile MINT ID']

for index, value in mint_profile_id.items():
  print(f"Row {index}: {value}")