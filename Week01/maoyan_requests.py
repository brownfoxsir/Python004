# -*- coding: utf-8 -*-
"""
Created on Sat Sep 26 10:55:02 2020

@author: derek
"""

import requests
import pandas as pd
from bs4 import BeautifulSoup

user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36 Edg/85.0.564.63'

url = 'https://maoyan.com/films?showType=3'

cookies = '__mta=42906394.1600821957025.1601090255347.1601092125577.5; uuid_n_v=v1; uuid=221982E0FD3611EA985FDD1498D583AFDD90641E6EBA4532BDA6F880AF5D740F; mojo-uuid=af4134bb046d83b91cd688efdb9da22f; _lx_utm=utm_source%3Dbing%26utm_medium%3Dorganic; _lxsdk_cuid=174b86c91434a-081ce0187f864b-7d647865-100200-174b86c9144c8; _lxsdk=221982E0FD3611EA985FDD1498D583AFDD90641E6EBA4532BDA6F880AF5D740F; mojo-session-id={"id":"b7f46262e47827b4e94715c827c56c43","time":1601088812562}; _csrf=2fcf37f4f71d12956bbfe5e95fd3adfc9efb2dfac0e60b47f5086a4b85bd29ab; Hm_lvt_703e94591e87be68cc8da0da7cbd0be2=1600821957,1601088813,1601089122,1601092104; mojo-trace-id=53; Hm_lpvt_703e94591e87be68cc8da0da7cbd0be2=1601092780; __mta=42906394.1600821957025.1601092125577.1601092780602.6; _lxsdk_s=174c85478b8-236-ec3-119%7C%7C86'
headers = {'user-agent': user_agent, 'cookies': cookies}
response = requests.get(url, headers=headers)

soup = BeautifulSoup(response.text, 'html.parser')
# print(soup.prettify())
movie_list = []

for movie_info in soup.find_all('div', attrs={'class': 'movie-hover-info'}, limit=10):
    for title in movie_info.find_all('div'):
        for child in title.contents[1].children:
            # print(child, str(title.contents[2]).strip())
            movie_list.append([child, str(title.contents[2]).strip()])
        for integer in title.find_all('i', attrs={'class': 'integer'}):
            pass
        for fraction in title.find_all('i', attrs={'class': 'fraction'}):
            pass
    # print('评分：', integer.string+fraction.string)
    movie_list.append(['评分：', integer.string+fraction.string])

movies = pd.DataFrame(data=movie_list)
movies.to_csv('./movies_maoyan.csv', encoding='UTF-8', index=False, header=False,)
