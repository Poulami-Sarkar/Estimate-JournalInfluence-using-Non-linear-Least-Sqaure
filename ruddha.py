import urllib.request
from bs4 import BeautifulSoup
import pandas as pd

url = 'http://www.researcherid.com/rid/'
df = pd.read_csv('/home/aniruddha/Downloads/countries/ani.csv')
df.head()


for rid in df.iloc[:,4]:
    page = urllib.request.urlopen(url+rid).read()
    soup = BeautifulSoup(page, 'lxml')
    email = soup.find(id='ProfileView_researcher_email')
    if(email):
	    print(email.labe;)
    else:
	#no email present
