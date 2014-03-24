from flask import Flask, render_template, request
import MySQLdb, dBase
app = Flask(__name__)

@app.route('/')
def mainIndex():
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

@app.route('/search_recipe/<id>',methods = ['GET','POST'])
def searchRecipe(id):
  info = []
  info.append(id)
  info.append(id)
  info.append(id)
  print info
  print info[0]
  print info[1]
  print info[2]
  ingredients = []
  comments = []
  if request.method == 'POST':
    print request.form['comment']
    #do stuff if the user just posted a comment

  #canComment is true if the user is logged in, and hence can post a comment
  return render_template('search_recipe.html',info = info,ingredients = ingredients,comments = comments,canComment = True)

@app.route('/underConstruction')
def underConstruction():
  return render_template('underConstruction.html')

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=3000)
