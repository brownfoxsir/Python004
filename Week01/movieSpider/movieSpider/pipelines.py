# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter
import pandas as pd
import pymysql


class MoviespiderPipeline:
    def process_item(self, item, spider):
        movie_info = {
            '电影名称': [item['movie_name']],
            '电影评分': [item['movie_score']],
            '主演': [item['movie_actor']],
            '电影类型': [item['movie_type']],
            '上映时间': [item['movie_time']],
        }
        print(movie_info)
        movie_csv = pd.DataFrame(data=movie_info)
        movie_csv.to_csv('./maoyan_movies.csv', encoding='utf8',
                         index=False, mode='a', header=False)
        return item


class MysqlPipeline:
    def __init__(self, host, database, user, password, port):
        self.host = host
        self.database = database
        self.user = user
        self.password = password
        self.port = port

    @classmethod
    def from_crawler(cls, crawler):
        """
        docstring
        """
        return cls(
            host=crawler.settings.get('MYSQL_HOST'),
            database=crawler.settings.get('MYSQL_DATABASE'),
            user=crawler.settings.get('MYSQL_USER'),
            password=crawler.settings.get('MYSQL_PASSWORD'),
            port=crawler.settings.get('MYSQL_PORT')
        )

    def open_spider(self, spider):
        self.db = pymysql.connect(
            self.host, self.user, self.password,  self.database, port=self.port)
        self.cursor = self.db.cursor()

    def close_spider(self, spider):
        self.db.close()

    def process_item(self, item, spider):
        data = dict(item)
        keys = ','.join(data.keys())
        values = ','.join(['%s']*len(data))
        sql = 'INSERT  INTO  %s (%s) VALUES  (%s)' % (item.table, keys, values)
        self.cursor.execute(sql, tuple(data.values()))
        self.db.commit()
        return item
