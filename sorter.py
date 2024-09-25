import pandas as pd

# Load the Excel file
file_path = "denver_data.xlsx"
df = pd.read_excel(file_path, engine ='openpyxl')

mint_profile_id = df['Profile MINT ID']
list = ""


for index, value in mint_profile_id.items():
  if pd.notna(value):
    list += str(int(value)) + ", "

new_list = list[:-2]
print(new_list)

