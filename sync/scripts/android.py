#!/usr/bin/python
# -*- coding=utf-8 -*-
import sys

from string import rfind
from time import mktime, strptime
from os import makedirs, path, stat, utime, system
from urllib import urlretrieve, urlopen
from xml.etree import ElementTree
#请不要随意更改base_url,本程序根据文件修改日期和长度判定文件是否i变化，更换base_url会导致所有文件重新下载一遍
base_url = ' http://mirrors.neusoft.edu.cn/android/repository/'
out_dir = '/srv/mirrors/android/repository'

def cbk(a, b, c): 
   '''回调函数
   @a: 已经下载的数据块
   @b: 数据块的大小
   @c: 远程文件的大小
   ''' 
   per = 100.0 * a * b / c 
   if per > 100: 
       per = 100 
   sys.stdout.flush()
   print '%.2f%%'%per

def download(filename, last_modified):
   fileurl = base_url + filename
   file = out_dir + filename
   cmd = "wget -c6"
   print 'Downloading ' + filename
#   urlretrieve(base_url + filename, file, cbk)
#   urlretrieve(fileurl, file, cbk)
   urlretrieve(fileurl, file)
#   system(cmd+fileurl)
   utime(file, (last_modified, last_modified))

   process(filename)

def process(filename, size=-1):
   file = out_dir + filename
   if path.isfile(file) and stat(file).st_size == size:
      print 'Skipping: ' + filename
      return

   print 'Processing: ' + filename
   handle = urlopen(base_url + filename)
   headers = handle.info()
   content_length = int(headers.getheader('Content-Length'))
   last_modified = mktime(strptime(headers.getheader('Last-Modified'), '%a, %d %b %Y %H:%M:%S %Z'))

   if rfind(filename, '/') > 0:
      dir = out_dir + filename[:rfind(filename, '/')]
   else:
      dir = out_dir

   if not path.isdir(dir):
      print 'Creating ' + dir
      makedirs(dir)

   if not path.isfile(file):
      download(filename, last_modified)
   else:
      file_stat = stat(file)
      if file_stat.st_mtime != last_modified or file_stat.st_size != content_length:
         download(filename, last_modified)
      else:
         print 'Skipping: ' + filename

def fetch(file):
   if base_url in file:
      dir = file[len(base_url) - 1:rfind(file, '/') + 1]
      file = file[rfind(file, '/') + 1:]
   elif 'http' in file:
      return -1
   else:
      dir = '/'
   process(dir + file)
   base_dir = path.dirname(dir + file)
   if base_dir != '/':
      base_dir += '/'
   tree = ElementTree.parse(out_dir + dir + file)
   for element in tree.getiterator():
      if element.tag.split('}')[1] == 'url':
         if element.text[-4:] != '.xml':
            if not 'http' in element.text:
               process(base_dir + element.text)
         else:
            fetch(element.text)
   return 0
if __name__=="__main__":
    for file in ['repository-10.xml', 'addons_list-2.xml']:
        fetch(file)
