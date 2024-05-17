import os
import re
import csv

def list_sql_files(directory):
    return [f for f in os.listdir(directory) if f.endswith('.sql') and os.path.isfile(os.path.join(directory, f))]

def sql_to_csv(sql_file, csv_file):
    insert_pattern = re.compile(r"INSERT INTO \w+ \(([^)]+)\) VALUES \(([^)]+)\);")
    
    with open(sql_file, 'r', encoding='utf-8') as f:
        sql_content = f.read()

    match = insert_pattern.search(sql_content)
    if not match:
        print(f"No INSERT statements found in {sql_file}.")
        return

    columns = match.group(1).split(", ")
    rows = []
    
    for match in insert_pattern.finditer(sql_content):
        values = match.group(2).split(", ")
        values = [value.strip("'") for value in values]
        rows.append(values)

    # Write to CSV
    with open(csv_file, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(columns)
        writer.writerows(rows)

def convert_all_sql_to_csv(directory):
    sql_files = list_sql_files(directory)
    for sql_file in sql_files:
        base_name = os.path.splitext(sql_file)[0]
        csv_file = os.path.join(directory, f"{base_name}.csv")
        sql_file_path = os.path.join(directory, sql_file)
        print(f"Converting {sql_file} to {csv_file}")
        sql_to_csv(sql_file_path, csv_file)

directory_path = 'absolute/path/to/data/directory'
convert_all_sql_to_csv(directory_path)
