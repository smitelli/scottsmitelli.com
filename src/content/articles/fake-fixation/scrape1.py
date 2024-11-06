# pip install requests beautifulsoup4 html5lib

import urllib
import requests
from bs4 import BeautifulSoup

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'}
index_url = 'https://www.lyrics.com/artist/Seether/530636'

html = requests.get(index_url, headers=headers).content
soup = BeautifulSoup(html, features='html5lib')
sub_el = soup.find(class_='tdata-ext')

for link in sub_el.find_all('a'):
    href = link.get('href')
    abs_href = urllib.parse.urljoin(index_url, href)

    print(abs_href)
