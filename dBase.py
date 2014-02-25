# utils.py
import MySQLdb

#this program attempts to wrap some of the calls to mySQL


DATABASE=''
DB_USER = ''
DB_PASSWORD = ''
HOST = ''
TABLE = ''
initialized = False
database = None
cursor = None

def dBaseInit():
  database = MySQLdb.connect(HOST, DB_USER, DB_PASSWORD, DATABASE)#connects to database
  cursor = database.cursor()
  if(cursor is not None and database is not None):
    initialized = True
    
def queryName(searchTerm): #queries by exact name
  if initialized:
    return cursor.execute('Select * from ' + TABLE + ' where __ Like "' + search + '";')
  print "Not logged into database!"

def searchSimilarName(searchTerm): #queries by term is contained in recipe name
  if initialized:
    return cursor.execute('Select * from ' + TABLE + ' where __ Like "%' + search + '%";')
  print "Not logged in to database!"