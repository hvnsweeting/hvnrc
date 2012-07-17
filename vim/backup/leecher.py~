#!/usr/bin/env python
#by HVNSweeting

from HTMLParser import HTMLParser
import urllib
import codecs
import string

FILE_NAME = 'kq.txt'
LINK = 'http://kqxs.vn/'

class MyHTMLParser(HTMLParser):
	"""Parser get content in first table in site"""
	def __init__(self):
		self.reset()
		self.fed = []
		self.found = False
		self.done = False
	def handle_starttag(self, tag, attrs):
		if tag == "table":
			self.found = True
		if tag == "/table":
			self.found = False

	def handle_endtag(self, tag):
		if tag == "table":
			self.done = True

	def handle_data(self, data):
		if self.found and not self.done:
			self.fed.append(data)

	def get_data(self):
		return self.fed

#read data from URL
response = urllib.urlopen(LINK)
#print response.headers['content-type']
html = response.read()

#html = '<html><head><title>Test</title></head><body><h1>Hap me! </h1><table width="100%"> hehe</table><table> hoho </table></body></html>'

#encode to utf-8, if not will get Exception when write to file
html = unicode(html, 'utf-8')

parser = MyHTMLParser()
parser.feed(html)

result = parser.get_data()
#write to file
fw = codecs.open(FILE_NAME, 'w', 'utf-8')
#line.strip() remove string contains only spaces
fw.writelines(line + '\n' for line in result if line.strip())
fw.close()

print "Done! data printed to file %s" %(FILE_NAME)
