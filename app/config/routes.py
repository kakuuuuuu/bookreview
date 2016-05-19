from system.core.router import routes

routes['default_controller'] = 'home'
routes['/'] = 'home#index'
routes['POST']['/adduser'] = 'Users#add'
routes['POST']['/Users/login'] = 'Users#login'
routes['/homepage'] = 'home#homepage'
routes['/Users/logout'] = 'Users#logout'
routes['/Books/add'] = 'home#newbook'
routes['POST']['/Books/addbook'] = 'Books#addbook'
routes['/Books/<book_id>'] = 'home#bookpage'
routes['POST']['/Reviews/add/<book_id>'] ='Reviews#addreview'
routes['/Users/<user_id>'] = 'home#userpage'
