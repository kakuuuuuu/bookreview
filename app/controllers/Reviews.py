from system.core.controller import *

class Reviews(Controller):
    def __init__(self, action):
        super(Reviews, self).__init__(action)

        self.load_model('Review')
        self.db = self._app.db
    def addreview(self, book_id):
        review_info={
            'book_id':int(book_id),
            'review':request.form['review'],
            'user_id':int(session['user']['id']),
            'rating':int(request.form['rating'])
        }
        self.models['Review'].create_review(review_info)
        url='/Books/'+str(book_id)
        return redirect(url)
