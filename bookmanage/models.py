from django.db import models
from hashlib import sha1
# Create your models here.
class Book(models.Model):
    category=models.CharField(max_length=10)
    title=models.CharField(max_length=40)
    press=models.CharField(max_length=30)
    year=models.IntegerField()
    author=models.CharField(max_length=20)
    price=models.DecimalField(max_digits=7,decimal_places=2)
    total=models.IntegerField()
    stock=models.IntegerField()
    def __str__(self):
        return str(self.pk)
    def serialize(self):
        return self.__dict__
    class Meta():
        db_table='book'
    @classmethod
    def create(cls,category,title,press,year,author,price,total,stock):
        b=Book()
        b.category=category
        b.title=title
        b.press=press
        b.year=year
        b.author=author
        b.price=price
        b.total=total
        b.stock=stock
        return b

class Card(models.Model):
    name=models.CharField(max_length=20)
    department=models.CharField(max_length=40)
    type=models.BooleanField()
    def __str__(self):
        return str(self.pk)
    class Meta():
        db_table='card'
    @classmethod
    def create(cls,name,department,type):
        c=Card()
        c.name=name
        c.department=department
        c.type=type
        return c

class Manager(models.Model):
    password=models.CharField(max_length=40)
    name=models.CharField(max_length=20)
    contact=models.CharField(max_length=20)
    def __str__(self):
        return str(self.pk)
    class Meta():
        db_table='manager'
    @classmethod
    def create(cls,pwd,name,contact):
        m=Manager()
        pwd_en = sha1(pwd.encode('utf-8')).hexdigest()
        m.password=pwd_en
        m.name=name
        m.contact=contact
        return m

class BorrowRecord(models.Model):
    borrow_date=models.DateField()
    return_date=models.DateField()
    book=models.ForeignKey('Book',on_delete=models.CASCADE)
    card=models.ForeignKey('Card',on_delete=models.CASCADE)
    return_manager=models.ForeignKey('Manager',on_delete=models.CASCADE)
    def __str__(self):
        return str(self.pk)
    class Meta():
        db_table='borrowrecord'
    @classmethod
    def create(cls,borrow_date,return_date,book_id,card_id,return_manager_id):
        br=BorrowRecord()
        br.borrow_date=borrow_date
        br.return_date=return_date
        br.book_id=book_id
        br.card_id=card_id
        br.return_manager_id=return_manager_id
        return br
