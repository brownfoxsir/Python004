# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter
import pandas as pd


class MoviespiderPipeline:
    def process_item(self, item, spider):
        movie_info = item['info']
        movies = pd.DataFrame(data=movie_info)
        movies.to_csv('./movies_top10.csv', encoding='UTF-8',
                      index=False, header=False,)
        return item
