from system.core.model import Model
import re
EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')
class User(Model):
    def __init__(self):
        super(User, self).__init__()
    def show_user(self,user_id):
        query="SELECT alias,users.name AS name, email, COUNT(reviews.id) AS count FROM users JOIN reviews ON users.id=reviews.user_id WHERE users.id=:id GROUP BY users.id"
        data = {'id': user_id}
        return self.db.query_db(query,data)[0]
    def create_user(self,info):
        errors=[]
        if len(info['name'])<2:
            errors.append('Name must be longer than 2 characters')
        if len(info['alias'])<2:
            errors.append('Alias must be longer than 2 characters')
        if len(info['email'])<1:
            errors.append('Email field must be filled')
        elif not EMAIL_REGEX.match(info['email']):
            errors.append('Not a valid email')
        if len(info['password'])<1:
            errors.append('Password field must be filled')
        if info['password']!=info['passconfirm']:
            errors.append('Password confirmation did not match')
        if errors:
            return {'status':False,'errors':errors}
        else:
            query = "INSERT INTO users (name, alias, email, password, created_at, updated_at) VALUES (:name, :alias, :email, :password, NOW(),NOW())"
            data={'name':info['name'],'alias':info['alias'],'email':info['email'],'password':self.bcrypt.generate_password_hash(info['password'])}
            self.db.query_db(query,data)
            query = "SELECT * FROM users WHERE email=:email"
            user = self.db.query_db(query,data)[0]
            return {'status':True,'user':user}
    def login_user(self,info):
        query="SELECT * FROM users WHERE email=:email LIMIT 1"
        data={'email':info['email']}
        users=self.db.query_db(query,data)
        if len(users)>0:
            if self.bcrypt.check_password_hash(users[0]['password'], info['password']):
                return users[0]
        return False
    # def show_user(self,user_id):
    #     query = "SELECT users.name, alias, email, COUNT(reviews.id), books.name FROM users LEFT JOIN "
