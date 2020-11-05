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
cookies = '__mta=42906394.1600821957025.1601193109508.1604478053782.9; mojo-uuid=af4134bb046d83b91cd688efdb9da22f; _lxsdk_cuid=174b86c91434a-081ce0187f864b-7d647865-100200-174b86c9144c8; uuid_n_v=v1; uuid=57828D801E7611EBA88A5FB353EF709A6A9172D2354442F9B1F4380C15715466; _lx_utm=utm_source%3Dbing%26utm_medium%3Dorganic; _lxsdk=57828D801E7611EBA88A5FB353EF709A6A9172D2354442F9B1F4380C15715466; _csrf=e6456cc1c2b082ace4abb57bf8d7806ab9c738790891a07b1c4d05cb51500a13; Hm_lvt_703e94591e87be68cc8da0da7cbd0be2=1602063142,1604477920,1604542746; Hm_lpvt_703e94591e87be68cc8da0da7cbd0be2=1604542783; __mta=42906394.1600821957025.1604478053782.1604542783097.10; _lxsdk_s=17596334d6f-924-655-d92%7C%7C5'

# request header
headers = {'User-Agent': user_agent, 'Cookie': cookies}
response = requests.get(url, headers=headers)

soup = BeautifulSoup(response.text, 'html.parser')
# print(soup.prettify())
movie_list = []

for title in soup.find_all('div', attrs={'class': 'movie-hover-info'}, limit=10):
    movie_name = title.find('span', attrs={'class': 'name'}).string
    movie_type = title.select('div ')[1].contents[2].strip()
    movie_actor = title.select('div ')[2].contents[2].strip()
    movie_star = title.select('div > span')[
        1].contents[0].string + title.select('div > span')[1].contents[1].string
    movie_release = title.select('div ')[3].contents[2].strip()
    movies_info = [movie_name, movie_type,
                   movie_actor, movie_star, movie_release]
    movie_list.append(movies_info)


movies = pd.DataFrame(data=movie_list, columns=[
                      '电影名称', '类型', '主演', '评分', '上映时间'])
print(movies)

movies.to_csv('./movies_maoyan.csv', encoding='UTF-8', index=False)
