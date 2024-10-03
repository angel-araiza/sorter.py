import pandas as pd
import matplotlib.pyplot as plt


# Load the Excel file
file_path = 'list_v5.xlsx'
df = pd.read_excel(file_path)

# Counts occurences of each category
category_counts = df['CityMetIn'].value_counts().reset_index()
# Rename the columns 
category_counts.columns = ['CityMetIn', 'Count']


kc_df = pd.read_excel('list_kc.xlsx')
ms_counts = kc_df['KeyClassification'].value_counts().reset_index()
ms_counts.columns = ['KeyClassification', 'Count']

month_counts = df['STARTMONTH'].value_counts().reset_index()
month_counts.columns = ['STARTMONTH', 'Count']


# Bar chart with category counts
plt.figure(figsize=(10,6))
plt.bar(category_counts['CityMetIn'].head(15), category_counts['Count'].head(15), color='skyblue')
plt.xlabel('Meeting Location')
plt.ylabel('Count')
plt.title('Count of top 15 Cities that have a meeting date from 2023 and on.')
plt.xticks(rotation=45)
plt.tight_layout()
# plt.show()


# Could have a graph that shows the time of year that these lost meetings tend to happen
# -- If so, I would need to collect Start Month and Day to do this off of. Maybe could do off of month
# Could ask chat for ideas on how to display this data

#Bar chart
plt.figure(figsize=(10,6))
plt.bar(month_counts['STARTMONTH'], month_counts['Count'], color='green')
plt.xlabel('Months')
plt.ylabel('Count')
plt.title('Month of Lost leads')
plt.xticks(rotation=45)
plt.tight_layout()


# Pie Chart
plt.figure(figsize=(14,8))
plt.pie(ms_counts['Count'].head(10),
          labels=ms_counts['KeyClassification'].head(10),
          autopct='%1.1f%%', 
          startangle=140,
          labeldistance=1.1,
          textprops={'fontsize':8})
plt.title('Pie Chart of Market Segments')
plt.tight_layout()



# A bell chart of the size of the meetings they lose
#Histogram
plt.figure(figsize=(10,6))
plt.hist(df['PEAKRMSRES'], bins=12, color='purple', edgecolor='black')
plt.xlabel('Peak Rooms Reserved')
plt.ylabel('Amount')
plt.title('The Peak Rooms in lost leads')
plt.tight_layout()
plt.show()




