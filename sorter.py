import pandas as pd

# Load the Excel file
file_path = "denver_data.xlsx"
df = pd.read_excel(file_path, engine ='openpyxl')

#Extract the columns
mint_profile_id = df['Profile MINT ID']
meeting_dates = df['Meeting Dates (Preferred Start)']

# Initialize an empty list to store the formatted strings
formatted_rows = []

# Iterate through the DataFrame
for index, row in df.iterrows():
  mint_id = row['Profile MINT ID']
  meeting_date = row['Meeting Dates (Preferred Start)']

  # Check if both values are not NaN
  if pd.notna(mint_id) and pd.notna(meeting_date):
    # Format the string and add it to the list
    formatted_rows.append(f"SELECT\n    CAST('{meeting_date.strftime('%Y')}' AS DATE) AS MeetingYear, {int(mint_id)} AS MtgID\nUNION ALL\n")

# NEXT TASK :: update the meeting date to be off of year, so that you can compare that field to the start year that is listed in MtgLog within the MINT Database


# Join the list into a single string
result_string = "".join(formatted_rows)

final = result_string[:-10]

# Specify the output file path
output_file_path = "output.txt"

# Write the result to a file path
with open(output_file_path, 'w') as file:
  file.write(final)

# Print a message indicating that the output was written to the file
print(f"Output written to {output_file_path}")
