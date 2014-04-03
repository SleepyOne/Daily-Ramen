from flask import Flask, render_template, request
import MySQLdb, dBase
app = Flask(__name__)

@app.route('/')
def mainIndex():
  dBase.dBaseInit()
  return render_template('index.html')

@app.route('/search', methods=['GET','POST'])
def search():
  
  searcher = ''
  if request.method == 'POST':
    searcher = request.form['searchword']
  dBase.dBaseInit()

  exactMatches = dBase.queryName(searcher)
  closeMatches = dBase.searchSimilarName(searcher)
  return render_template('search.html',matches=exactMatches,closeMatches=closeMatches)

@app.route('/login')
def login():
  return render_template('login.html')

@app.route('/createAccount')
def createAccount():
  return render_template('createAccount.html')

@app.route('/search_recipe=<id>',methods = ['GET','POST'])
def searchRecipe(id):
  info = dBase.getRecipeInfo(id)
  """print info[0][0]
  print info[0][1]
  print info[0][2]"""
  ingredients = dBase.getIngredients(id)
  comments = dBase.getComments(id)
  print '!!!!!!' + str(comments)
  if request.method == 'POST':
    print request.form['comment']
    #do stuff if the user just posted a comment

  #canComment is true if the user is logged in, and hence can post a comment
  return render_template('search_recipe.html',info = info[0],ingredients = ingredients,comments = comments,canComment = True)

@app.route('/underConstruction')
def underConstruction():
  return render_template('underConstruction.html')

@app.route('/recipeForm')
def recipeForm():
  return render_template('recipeForm.html')

@app.route('/submitRecipe',methods = ['POST'])
def submitRecipe():
  dBase.dBaseInit()
  title = request.form['title']
  print title
  length = len(request.form)
  text = request.form['directions']
  ingredients = []
  for i in range(1,length-1):
    if i != '':
      ingredients.append(request.form['i' + str(i)])#assembles the name of each ingredient text box
      print request.form['i' + str(i)]
  
  
  dBase.addRecipe(title,ingredients,text)
  return render_template('submitRecipe.html')

@app.route('/confirm', methods=['GET', 'POST'])
def confirm():
  global cursor
  DATABASE='RamenDB'
  DB_USER = 'RamenMaster'
  DB_PASSWORD = 'RamenPassword'
  HOST = 'localhost'
  database = MySQLdb.connect(HOST, DB_USER, DB_PASSWORD, DATABASE)
  cursor = database.cursor()
  name = request.form['name']
  password = request.form['password']
  
  query = "select user_name from users WHERE user_name = '%s'" % (name)
  cursor.execute(query)
  
  #if cursor.fetchone():
  #  return redirect(url_for('login.html'))
  query = "INSERT INTO users (user_name, password) VALUES ('%s','%s')" % (name, password)
  cursor.execute(query)
  database.commit()
  return render_template('index.html')

@app.route('/confirmLogin', methods=['GET', 'POST'])
def confirmLogin():
  name = request.form['name']
  password = request.form['password']
  if true:
    return render_template('index.html')

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=3000)
