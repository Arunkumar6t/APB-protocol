import time
import os.path
import re
import tkinter as tk
import matplotlib.pyplot as plt
import numpy as np
import csv

from tkinter import filedialog as fd
#!/C:/Python
# Create a CSV file for writing
csv_file = open("rr.csv", "w", newline='\n')
csv_writer = csv.writer(csv_file)

error_count = 0
fatal_count = 0

# Write the header to the CSV file
csv_writer.writerow(["FILENAME", "ERROR_COUNT", "FATAL_COUNT", "SEED_VALUE", "STATUS"])

# This will bring up the dialog box to select required files
list_of_files = fd.askopenfilenames()
print(list_of_files)
num_files = len(list_of_files)
# Initialize a list to hold data
data_list = []

# This for loop will convert array to scalar
for each_file in list_of_files:
    print(each_file)  # file printing in the form of scalar a.log
    # b.log
    # c.log

    # Open each file in read mode
    fh = open(each_file, "r")

    for fc in fh:
        error = re.match(".*UVM_ERROR :    (\d{1,})", fc)
        fatal = re.match(".*UVM_FATAL :    (\d{1,})", fc)
        seed_value = re.match(".*Sv_Seed = (\d{1,})", fc)
        if seed_value:
            seed = seed_value.group(1)
            print(seed)

        if error:
            error_count = error.group(1)
            print(error_count)
        if fatal:
            fatal_count = fatal.group(1)
    if int(error_count) == 0 and fatal_count == "0":
        print("PASS")
        status = "PASS"
    else:
        print("FAIL")
        status = "FAIL"
    print(os.path.basename(each_file) + "      " + each_file)

    # Append the data to the list
    data_list.append([os.path.basename(each_file), error_count, fatal_count, seed, status])

# Write the data to the CSV file
csv_writer.writerows(data_list)

# Close the CSV file
csv_file.close()

# Process data without Pandas
data = np.array(data_list)
categories, counts = np.unique(data[:, 4], return_counts=True)

# Generate bar chart
fig1, ax1 = plt.subplots()
ax1.bar(categories, counts, color=['red', 'green'], width=0.2)
ax1.set_xlabel('STATUS')
ax1.set_ylabel('COUNT')
ax1.set_xticklabels(categories)
ax1.set_title(f'PASS vs. FAIL Bar Chart for {num_files} selected files')

# Display the number of files selected in the bar graph
ax1.text(0.5, 0.9, f"Number of files selected {num_files}", horizontalalignment="center", fontsize=12, fontweight="bold")
#matplotlib.pyplot.show()
# Generate pie chart
fig2, ax2 = plt.subplots()
ax2.pie(counts, labels=categories, autopct="%1.1f%%")
ax2.set_title(f'Pie Chart of Status (PASS & FAIL) for {num_files} selected files')

ax2.legend()
plt.show()
time.sleep(10)
