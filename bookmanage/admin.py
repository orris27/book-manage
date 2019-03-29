from django.contrib import admin
from .models import *

class BookAdmin(admin.ModelAdmin):
    list_display = ['pk','category','title','press','year','author','price','total','stock']

# Register your models here.
admin.site.register(Book,BookAdmin)
admin.site.register(Card)
admin.site.register(BorrowRecord)
admin.site.register(Manager)