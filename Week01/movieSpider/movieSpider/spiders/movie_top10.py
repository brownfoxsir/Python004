import scrapy
from scrapy.selector import Selector

from movieSpider.items import MoviespiderItem


class Maoyantop10Spider(scrapy.Spider):
    name = 'movie_top10'
    allowed_domains = ['maoyan.com']
    start_urls = ['http://maoyan.com/']

    def start_requests(self):
        url = 'https://maoyan.com/films?showType=3'
        yield scrapy.Request(url, callback=self.parse)

    def parse(self, response):
        movies_info = Selector(response=response).xpath(
            '//div[@class="movie-hover-info"]')
        # movies_list = [movie.extract().split() for movie in movies_info.xpath('string(.)')]
        movies_list = []
        for movie in movies_info.xpath('string(.)'):
            movies_list.append(movie.extract().split())

        movie_top10 = [movies_list[movie] for movie in range(10)]
        item = MoviespiderItem()
        item['info'] = movie_top10
        return item
