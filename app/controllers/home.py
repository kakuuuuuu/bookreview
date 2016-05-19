from system.core.controller import *

class home(Controller):
    def __init__(self, action):
        super(home, self).__init__(action)

        self.load_model('User')
        self.load_model('Book')
        self.load_model('Review')
        self.db = self._app.db
        if 'logstatus' not in session:
            session['logstatus']=False
        if 'user' not in session:
            session['user']=None
    def index(self):
        if session['logstatus']==True:
            return redirect('/homepage')
        return self.load_view('index.html')
    def homepage(self):
        if session['logstatus']==False:
            return redirect('/')
        books=self.models['Book'].show_all_books()
        reviews=self.models['Review'].show_all_reviews()
        return self.load_view('/Users/index.html',books=books, reviews=reviews)
    def newbook(self):
        if session['logstatus']==False:
            return redirect('/')
        authors=self.models['Book'].show_authors()
        return self.load_view('/Books/newbook.html',authors=authors)
    def bookpage(self,book_id):
        if session['logstatus']==False:
            return redirect('/')
        book=self.models['Book'].show_book(book_id)
        reviews=self.models['Review'].show_reviews(book_id)
        return self.load_view('/Books/book.html', book=book, reviews=reviews)
    def userpage(self,user_id):
        if session['logstatus']==False:
            return redirect('/')
        user=self.models['User'].show_user(user_id)
        reviews=self.models['Review'].show_user_reviews(user_id)
        return self.load_view('Users/userpage.html',user=user,reviews=reviews)
