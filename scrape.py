import requests
import pandas as pd
from bs4 import BeautifulSoup
import re
data = pd.DataFrame()
for i in range(1,24):
    url = "https://www.sciencedirect.com/journal/astronomy-and-computing/vol/"+str(i)+"/suppl/C"
    r = requests.get(url)
    soup = BeautifulSoup(r.text, 'lxml')
    count =0
    if (r.status_code == 200):
        for article in soup.find_all(class_ = "js-article-list-item article-item u-padding-top-xs u-margin-bottom-m"):
            count = count +1; 
        data = data.append({
            'date':re.findall('\((.*?)\)',soup.find(class_="js-issue-status text-s").get_text()),
            'volume':i,
            'articles':count},ignore_index=True)
print(data)
data.to_csv("/home/poulami/Documents/Github/JournalInfluence/dataFiles/publisher.csv")