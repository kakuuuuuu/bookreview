"""
    Sample Model File

    A Model should be in charge of communicating with the Database.
    Define specific model method that query the database for information.
    Then call upon these model method in your controller.

    Create a model using this template.
"""
from system.core.model import Model

class Book(Model):
    def __init__(self):
        super(Book, self).__init__()
    def show_all_books(self):
        query = "SELECT name,id FROM books"
        return self.db.query_db(query)
    def show_book(self,book_id):
        query = "SELECT * FROM books WHERE id=:id"
        data={'id':book_id}
        return self.db.query_db(query,data)[0]
    def show_authors(self):
        query = "SELECT author FROM books GROUP BY author"
        return self.db.query_db(query)
    def add_book(self,info):
        checkquery = "SELECT name FROM books WHERE name=:name"
        checkdata={'name':info['title']}
        if len(self.db.query_db(checkquery,checkdata))==0:
            query = "INSERT INTO books (author,name,created_at,updated_at) VALUES(:author,:name,NOW(),NOW())"
            data={'author':info['author'],'name':info['title']}
            self.db.query_db(query,data)
        query = "SELECT id FROM books WHERE name=:name"
        data={'name':info['title']}
        book_id=self.db.query_db(query,data)[0]['id']
        print info['id']
        query = "INSERT INTO reviews (rating, user_id, book_id, review, created_at, updated_at) VALUES(:rating, :user_id, :book_id,:review, NOW(), NOW())"
        data={'rating':int(info['rating']),'user_id':int(info['id']),'book_id':int(book_id),'review':info['review']}
        self.db.query_db(query,data)
        return book_id
