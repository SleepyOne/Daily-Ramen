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
    cursor.execute('Select * from ' + MySQLdb.escape_string(TABLE) + ' where recipe_name Like "' + "%a%" + '";')
    stu = cursor.fetchall()
    for x in stu:
      print x[1]
    global initialized
    initialized = True
    
def queryName(searchTerm): #queries by exact name
  if initialized:
    global cursor
    cursor.execute('Select * from ' + MySQLdb.escape_string(TABLE) + ' where recipe_name like "' + MySQLdb.escape_string(searchTerm) + '";')
    return cursor.fetchall()
  else:
    print "Not logged in to database!\n"

def searchSimilarName(searchTerm): #queries by term is contained in recipe name
  if initialized:
    global cursor
    cursor.execute('Select * from ' + MySQLdb.escape_string(TABLE) + ' where recipe_name Like "%' + MySQLdb.escape_string(searchTerm) + '%" and recipe_name not like "' + MySQLdb.escape_string(searchTerm) + '";')
    return cursor.fetchall()
  else:
    print "Not logged in to database!\n"

def getRecipeInfo(searchID): #gets specific information from a given recipe id    
  global cursor
  if initialized:
    print 'Select recipe_name, recipe_creator, recipe_instructions from recipes where recipe_id = ' + MySQLdb.escape_string(str(searchID)) + ';'
    cursor.execute('Select recipe_name, recipe_creator, recipe_instructions from recipes where recipe_id = ' + MySQLdb.escape_string(str(searchID)) + ';')
    return cursor.fetchall()
  else:
    print "Not logged in to database!\n"

  
def getIngredients(searchID):#gets the ingredients of a given recipe id
  global cursor
  if initialized:
    cursor.execute('Select ing.ingredient_name from recipes rec inner join recipeIngredients ri inner join ingredients ing on rec.recipe_id = ri.recipe_id and ri.ingredient_id = ing.ingredient_id where rec.recipe_id = ' + MySQLdb.escape_string(str(searchID)) + ';')
    return cursor.fetchall()
  else:
    print "Not logged in to database!\n"

def getComments(searchID):#gets the commentss of a given recipe id
  global cursor
  if initialized:
    cursor.execute('Select cm.comment from recipes rec inner join comments cm on rec.recipe_id = cm.recipe_id where rec.recipe_id = ' + MySQLdb.escape_string(str(searchID)) + ';')
    return cursor.fetchall()
  else:
    print "Not logged in to database!\n"

def addComment(recipeID,text):#adds a comment to a given recipe id
  global cursor
  if initialized:
    cursor.execute('insert into comments values (NULL, '+ MySQLdb.escape_string(text) + ','+ MySQLdb.escape_string(str(searchID)) + ');')
    return cursor.fetchall()
  else:
    print "Not logged in to database!\n"    
    
def searchIngredients(searchTerm): #queries by ingredients the recipe contains
  if initialized:
    global cursor
    cursor.execute('Select * from ' + MySQLdb.escape_string(TABLE) + ' JOIN ingredients ON ingredients.ingredient_id = recipeIngredients.ingredient_id JOIN recipeIngredients ON recipes.recipe_id = recipeIngredients.recipe_id WHERE ingredients.ingredient_name like "%' + MySQLdb.escape_string(searchTerm) + '%;"')
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