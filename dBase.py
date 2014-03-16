# utils.py
import MySQLdb

#this program attempts to wrap some of the calls to mySQL


DATABASE='RamenDB'
DB_USER = 'RamenMaster'
DB_PASSWORD = 'RamenPassword'
HOST = 'localhost'
TABLE = 'recipes'
initialized = False
database = None
cursor = None

def dBaseInit():
  global database
  database = MySQLdb.connect(HOST, DB_USER, DB_PASSWORD, DATABASE)#connects to database
  global cursor
  cursor = database.cursor()
  if cursor is not None and database is not None:
    print 'in'
    cursor.execute('Select * from ' + TABLE + ' where recipe_name Like "' + "%a%" + '";')
    stu = cursor.fetchall()
    for x in stu:
      print x[1]
    global initialized
    initialized = True
    
def queryName(searchTerm): #queries by exact name
  if initialized:
    cursor.execute('Select * from ' + TABLE + ' where recipe_name like "' + searchTerm + '";')
    return cursor.fetchall()
  else:
    print "Not logged in to database!\n"

def searchSimilarName(searchTerm): #queries by term is contained in recipe name
  if initialized:
    cursor.execute('Select * from ' + TABLE + ' where recipe_name Like "%' + searchTerm + '%" and recipe_name not like "' + searchTerm + '";')
    return cursor.fetchall()
  else:
    print "Not logged in to database!\n"
	
def searchIngredients(searchTerm): #queries by ingredients the recipe contains
  if initialized:
    # Query will be added after we convert tables to 3NF
    return cursor.fetchall()
  else:
    print "Not logged in to database!\n"
  
"""
dBaseInit()
stuff = queryName('Ramen')
for x in stuff:
  print '->>>'+str(x[0])
stuff = searchSimilarName('amen')
for x in stuff:
  print '->>>'+str(x[0])
"""