# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Comment(models.Model):
    film_name = models.ForeignKey('MovieDetail', models.DO_NOTHING, db_column='film_name')
    nickname = models.CharField(max_length=255, blank=True, null=True)
    comment = models.CharField(max_length=2048, blank=True, null=True)
    comment_date = models.DateTimeField(blank=True, null=True)
    star = models.CharField(max_length=255, blank=True, null=True)
    agree = models.BigIntegerField(blank=True, null=True)

    def __str__(self):
        return str(self.film_name)


class MovieDetail(models.Model):
    name = models.CharField(max_length=255)
    director = models.CharField(max_length=255)
    writer = models.CharField(max_length=255, blank=True, null=True)
    actor = models.CharField(max_length=1000, blank=True, null=True)
    area = models.CharField(max_length=255, blank=True, null=True)
    language = models.CharField(max_length=255, blank=True, null=True)
    release_time = models.CharField(max_length=255, blank=True, null=True)
    film_type = models.CharField(max_length=255, blank=True, null=True)
    film_length = models.CharField(max_length=255, blank=True, null=True)
    another_name = models.CharField(max_length=255, blank=True, null=True)
    rank = models.IntegerField(blank=True, null=True)
    score = models.CharField(max_length=255, blank=True, null=True)
    img_link = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return self.name
