#!/bin/python3
import datetime
import urllib.request as req
import xml.etree.ElementTree as etree

if __name__ == "__main__":
    date = datetime.datetime.strftime(datetime.datetime.today() + datetime.timedelta(days=1), "%d/%m/%Y")
    currency = ("USD","EUR","JPY")
    cursym = dict(USD="",EUR="",JPY="")
    result = {}
    url='http://www.cbr.ru/scripts/XML_daily.asp?date_req=' + date

    xml = req.urlopen(url, data=None)
    tree = etree.parse(xml)
    root =tree.getroot()
    for curr in root.findall('Valute'):
        #name = curr.find('CharCode').text
        if curr.find('CharCode').text in currency:
            result[curr.find('CharCode').text] = curr.find('Value').text

    #for i,j in result.items():
    #    print(i,j, end=" ")
    for i in currency:
        print(cursym[i],(result.get(i))[:5],end=" ")
