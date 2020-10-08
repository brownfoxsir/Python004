import configparser
import requests
from fake_useragent import UserAgent


def config(file_path):
    """
    从本地读取用户信息
    配置文件格式：
    [login_info]
    login_email = email/phone
    login_password = password
    """

    config = configparser.ConfigParser()
    config.read(file_path, encoding='utf-8')
    form_data = {
        'login_email': config.get('login_info', 'login_email'),
        'login_password': config.get('login_info', 'login_password')
    }
    return form_data


def login(login_url, refere, host, form_data):
    """组装请求头,发起登录请求"""

    headers = {'User-Agent': str(UserAgent(verify_ssl=False).random),
               'Referer': referer, 'Host': host}
    response = requests.Session().post(login_url, headers=headers, data=form_data)
    return response


if __name__ == "__main__":
    config_file_path = 'C:\\Users\\admin\\processon.ini'
    referer = 'https://processon.com/login?f=index'
    host = 'processon.com'
    login_url = 'https://processon.com/login'
    response = login(login_url, referer, host,
                     form_data=config(config_file_path))
    print(response.status_code)
