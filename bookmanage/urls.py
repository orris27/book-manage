from django.contrib import admin
from django.urls import path,include
from .import views

urlpatterns = [
    path('',views.index,name='index'),

    path('base/',views.base,name="base"),

    path('book/add/',views.book_add,name="book_add"),
    path('books/add/',views.books_add,name="books_add"),

    path('query/',views.query,name='query'),
    path('query/books/',views.query_books,name='query_books'),
    path('card/',views.card,name='card'),
    path('card/login/',views.card_login,name='card_login'),
    path('card/login/notexists/',views.card_login_notexists,name='card_login_notexists'),
    path('card/handle/',views.card_handle,name='card_handle'),
    path('card/login/handle/',views.card_login_handle,name='card_login_handle'),
    path('card/exit/',views.card_exit,name='card_exit'),
    path('card/exists/',views.card_exists,name='card_exists'),
    path('card/books/',views.card_books,name='card_books'),
    path('cards/query/',views.cards_query,name='cards_query'),
    path('card/delete/',views.card_delete,name='card_delete'),
    path('card/borrowed/',views.card_borrowed,name='card_borrowed'),

    path('booktitle/query/',views.booktitle_query,name='booktitle_query'),
    path('books/query/',views.books_query,name="books_query"),
    path('bookid_cardid/exists/',views.bookid_cardid_exists,name='bookid_cardid_exists'),


    path('manager/',views.manager,name='manager'),
    path('manager/login/',views.manager_login,name='manager_login'),
    path('manager/login/notexists',views.manager_login_notexists,name='manager_login_notexists'),
    path('manager/login/handle/',views.manager_login_handle,name='manager_login_handle'),
    path('manager/exit/',views.manager_exit,name='manager_exit'),
    path('manager/create/',views.manager_create,name='manager_create'),
    path('manager/create/handle/',views.manager_create_handle,name='manager_create_handle'),
    path('manager/add/books/',views.manager_add_books,name='manager_add_books'),
    path('manager/add/card/',views.manager_add_card,name='manager_add_card'),
    path('manager/add/card/handle/',views.manager_add_card_handle,name='manager_add_card_handle'),
    path('manager/exists/', views.manager_exists, name='manager_exists'),

]