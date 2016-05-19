from system.core.controller import *

class Books(Controller):
    def __init__(self, action):
        super(Books, self).__init__(action)

        self.load_model('Book')
        self.db = self._app.db
    # def add(self):
    #     book_info={
    #         'title':request.form['title'],
    #         'author':'',
    #         'review':request.form['review'],
    #         'rating':request.form['rating']
    #     }
    #     if request.form['authorB']:
    #         print request.form['authorB']
    #     else:
    #         print request.form['authorA']
    #     return redirect('/homepage')
    def addbook(self):
        book_info={
            'title':request.form['title'],
            'author':'',
            'review':request.form['review'],
            'rating':request.form['rating'],
            'id':session['user']['id']
        }
        if request.form['authorB']:
            print "here"
            book_info['author']=request.form['authorB']
        else:
            print "there"
            book_info['author']=request.form['authorA']
        book_id = self.models['Book'].add_book(book_info)
        print book_info['id']
        url='/Books/'+str(book_id)
        return redirect(url)
