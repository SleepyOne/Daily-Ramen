from flask import Flask, render_template, request
import MySQLdb, dBase
app = Flask(__name__)

@app.route('/')
def mainIndex():
  return render_template('index.html')

@app.route('/search.ext', methods=['POST'])
def search():

  searcher = request.form['searchword']

  dBase.dBaseInit()

  exactMatches = dBase.queryName(searcher)
  closeMatches = dBase.searchSimilarName(searcher)
  return render_template('search.ext',matches=exactMatches,closeMatches=closeMatches)

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=3000)
