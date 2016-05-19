from system.core.controller import *

class Users(Controller):
    def __init__(self, action):
        super(Users, self).__init__(action)

        self.load_model('User')
        self.db = self._app.db
    def add(self):
        user_info={
            'name':request.form['name'],
            'alias':request.form['alias'],
            'email':request.form['email'],
            'password':request.form['password'],
            'passconfirm':request.form['passconfirm']
        }
        check = self.models['User'].create_user(user_info)
        if check['status']==True:
            session['logstatus']=True
            session['user']=check['user']
            return redirect('/homepage')
        else:
            for error in check['errors']:
                flash(error,'home_error')
                return redirect('/')
    def login(self):
        user_info={
            'email':request.form['email'],
            'password':request.form['password']
        }
        check = self.models['User'].login_user(user_info)
        if check!=False:
            session['logstatus']=True
            session['user']=check
            return redirect('/homepage')
        else:
            flash('Incorrect email or password','home_error')
        return redirect('/')
    def logout(self):
        session['logstatus']=False
        session.pop('user')
        return redirect('/')
