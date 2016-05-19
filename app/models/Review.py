"""
    Sample Model File

    A Model should be in charge of communicating with the Database.
    Define specific model method that query the database for information.
    Then call upon these model method in your controller.

    Create a model using this template.
"""
from system.core.model import Model

class Review(Model):
    def __init__(self):
        super(Review, self).__init__()
    def show_all_reviews(self):
        query = "SELECT rating, review, DATE_FORMAT(reviews.created_at, '%M %e, %Y' ) AS created_at, books.name,books.id AS bookid, alias, users.id AS userid FROM reviews JOIN books ON reviews.book_id=books.id JOIN users ON reviews.user_id=users.id ORDER BY reviews.created_at DESC"
        return self.db.query_db(query)
    def show_reviews(self,book_id):
        query = "SELECT rating, review, DATE_FORMAT(reviews.created_at, '%M %e, %Y' ) AS created_at, alias, users.id AS userid FROM reviews JOIN books ON reviews.book_id=books.id JOIN users ON reviews.user_id=users.id WHERE books.id=:id"
        data={'id':book_id}
        return self.db.query_db(query,data)
    def show_user_reviews(self,user_id):
        query = "SELECT name,books.id FROM reviews JOIN books ON reviews.book_id=books.id WHERE reviews.user_id=:id GROUP BY books.name"
        data={'id':user_id}
        return self.db.query_db(query,data)
    def create_review(self,info):
        query = "INSERT INTO reviews (user_id,book_id,rating,review,created_at,updated_at) VALUES (:user_id,:book_id,:rating,:review,NOW(),NOW())"
        data = {'user_id':info['user_id'],'book_id':info['book_id'],'rating':info['rating'],'review':info['review']}
        self.db.query_db(query,data)
