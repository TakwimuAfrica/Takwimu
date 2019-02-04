import glob
import os

import pandas as pd

def get_columns(df, excluding):
    columns = df.columns
    return list(set(columns) - set(excluding))

def batch_import_csv(paths):
    f = "python /Users/ahereza/Work/CodeForAfrica/Takwimu/manage.py importcsv {} --table {} --geo_version 2009 --columns {}"
    for i in paths:
        df = pd.read_csv(i)
        cols = get_columns(df, ['geography', 'total'])
        x = i.split('/')
        s = x[-1]
        table = s.split('.')[0]
        command = f.format(i, table.lower(), " ".join(cols))
        print command
        os.system(command)


if __name__ == '__main__':
    paths = glob.glob("/Users/ahereza/Work/CodeForAfrica/takwimu_scrapers/scraped_data/*.csv")
    batch_import_csv(paths)

    for path in paths:
        path = path.replace('.csv', '.sql')
        f = open(path, "w")
        f.close()
