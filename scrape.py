import urllib.request
from bs4 import BeautifulSoup

url = "https://scholar.google.com/citations?user=W2AZCyWMhCoC"

#soup = BeautifulSoup(url) 
page = urllib.request.urlopen(url).read()
soup = BeautifulSoup(page)
tbody = soup.find(id="gsc_a_b")
table = tbody.find_all(class_="gsc_a_tr")
#print(table.find(class_='gsc_y'))
for row in tbody.find_all(class_="gsc_a_tr"):
    #title = row.find(class_='gsc_t')
    citation = row.find(class_='gsc_c')
    year = row.find(class_='gsc_y')
    #print(year)