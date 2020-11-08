# Generated by Django 3.1.3 on 2020-11-07 13:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='MovieDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('director', models.CharField(max_length=255)),
                ('writer', models.CharField(blank=True, max_length=255, null=True)),
                ('actor', models.CharField(blank=True, max_length=1000, null=True)),
                ('area', models.CharField(blank=True, max_length=255, null=True)),
                ('language', models.CharField(blank=True, max_length=255, null=True)),
                ('release_time', models.CharField(blank=True, max_length=255, null=True)),
                ('film_type', models.CharField(blank=True, max_length=255, null=True)),
                ('film_length', models.CharField(blank=True, max_length=255, null=True)),
                ('another_name', models.CharField(blank=True, max_length=255, null=True)),
                ('rank', models.IntegerField(blank=True, null=True)),
                ('score', models.CharField(blank=True, max_length=255, null=True)),
                ('img_link', models.CharField(blank=True, max_length=255, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nickname', models.CharField(blank=True, max_length=255, null=True)),
                ('comment', models.CharField(blank=True, max_length=2048, null=True)),
                ('comment_date', models.DateTimeField(blank=True, null=True)),
                ('star', models.CharField(blank=True, max_length=255, null=True)),
                ('agree', models.BigIntegerField(blank=True, null=True)),
                ('film_name', models.ForeignKey(db_column='film_name', on_delete=django.db.models.deletion.DO_NOTHING, to='movie.moviedetail')),
            ],
        ),
    ]