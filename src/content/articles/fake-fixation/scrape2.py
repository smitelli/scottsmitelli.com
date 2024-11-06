import requests
import time
from bs4 import BeautifulSoup

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'}

i = 0
with open('scrape1.out.txt', 'r') as f:
    for line in f.readlines():
        i += 1
        if i < 377:
            continue
        print(i, end=' ')

        url = line.strip()
        try:
            html = requests.get(url, headers=headers).content
            soup = BeautifulSoup(html, features='html5lib')
            sub_el = soup.find(id='lyric-body-text')

            if 'fak' in sub_el.text.lower():
                print('YESS', end='\t')
            else:
                print('NO', end='\t')
        except Exception:
            print('ERR!', end='\t')
        print(url)
        time.sleep(2)
