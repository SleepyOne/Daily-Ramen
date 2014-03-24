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

@app.route('/underConstruction')
def underConstruction():
  return render_template('underConstruction.html')

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=3000)
