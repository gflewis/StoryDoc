'''
Created on Mar 28, 2017

@author: gfl01
'''
from credentials import instance, username, password
import requests
import argparse
parser = argparse.ArgumentParser()
parser.add_argument('-t', '--table', dest='table', required=True)
parser.add_argument('-q', '--query', dest='query')
parser.add_argument('-o', '--output', dest='output')
args = parser.parse_args()
parms = '?sysparm_display_value=all'
if args.query: parms += '&sysparm_query=' + args.query
headers = {'Accept' : 'application/xml'}
url = instance + 'api/now/table/' + args.table + parms
r = requests.get(url, headers=headers, auth=(username, password))
if args.output:
    outfile = open(args.output, 'w', encoding='utf-8')
    outfile.write(r.text)
else:
    print(r.text)