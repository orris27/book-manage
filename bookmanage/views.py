from django.shortcuts import render,redirect,reverse
from .models import *
from django.http import HttpResponse,JsonResponse,HttpResponseRedirect
from hashlib import sha1
import json

# Create your views here.
def index(request):
    err_name=request.GET.get('err_name',0)
    err_pwd=request.GET.get('err_pwd',0)
    username=request.GET.get('username',"")
    context={'title':'首页','err_name':json.dumps(err_name),'err_pwd':json.dumps(err_pwd),'username':json.dumps(username)}
    return render(request,'bookmanage/index.html',context)

def query(request):
    context={"title":"查询"}
    return render(request,'bookmanage/query.html',context)

def query_books(request):
    post=request.POST

    books=Book.objects.all()
    count=0
    value=post.get('title',default="")
    if len(value)!=0:
        count+=1
        books=books.filter(title=value)

    value = post.get('author', default="")
    if len(value) != 0:
        count+=1
        books = books.filter(author=value)

    value = post.get('press', default="")
    if len(value) != 0:
        count += 1
        books = books.filter(press=value)

    value = post.get('year', default="")
    if len(value) != 0:
        count += 1
        books = books.filter(year=int(value))

    value = post.get('category', default="")
    # print(post)
    # print(value)
    if len(value) != 0:
        count += 1
        books = books.filter(category=value)

    value=post.get('price',default="")
    if len(value)!=0:
        count += 1
        books=books.filter(price=float(value))

    value = post.get('total', default="")
    if len(value) != 0:
        count += 1
        books = books.filter(total=int(value))

    value = post.get('stock', default="")
    if len(value) != 0:
        count += 1
        books = books.filter(stock=int(value))

    books=list(books.values())
    # print(books)
    if count==0:
        books=[]
    # print(count)
    return JsonResponse({"data":books})


def card(request):
    card_name=request.session.get('card_name',default=None)
    if card_name is None:
        return redirect(reverse("bookmanage:card_login"))
    res=Card.objects.filter(name=card_name)
    if len(res) == 0:
        return redirect(reverse("bookmanage:card_login"))
    brs=BorrowRecord.objects.filter(card_id=res[0].id)
    bookidlist=[]
    for br in brs:
        bookidlist.append(br.book_id)
    booklist=list(Book.objects.filter(pk__in=bookidlist))
    context={'booklist':booklist,"card_name":json.dumps(card_name),"card_name_org":card_name,"title":"借书/还书"}
    return render(request,'bookmanage/card.html',context)

def card_login(request):
    return render(request,'bookmanage/card_login.html')

def card_login_handle(request):
    card_name=request.POST.get('card_name')
    res=Card.objects.get(name=card_name)
    request.session['card_name']=card_name
    return redirect(reverse("bookmanage:card"))

def card_login_notexists(request):
    return render(request,'bookmanage/card_login_notexists.html')

def card_handle(request):
    option=request.POST['option_card']
    # print(request.POST['book_id'])# empty
    book_id=int(request.POST['book_id'])

    card_name=request.session['card_name']
    card_res=Card.objects.filter(name=card_name)
    card_id=card_res[0].id
    brs=BorrowRecord.objects.filter(card_id=card_id)
    bookids=[]
    for br in brs:
        bookids.append(br.book_id)
    from datetime import date

    test=Book.objects.filter(pk=book_id)
    if len(test) == 0:
        return render(request,'bookmanage/book_notexists.html')

    if option == "borrow":
        if book_id not in bookids:
            bof=Book.objects.get(pk=book_id)
            if bof.stock == 0:
                return render(request,'bookmanage/card_handle.html')
            else:
                bof.stock-=1
                bof.save()
                br=BorrowRecord.create(date.today(),date.today().replace(month=date.today().month+1),
                                   book_id,card_id,1)
                br.save()
    elif option == "return":
        if book_id in bookids  :
            bof = Book.objects.get(pk=book_id)
            bof.stock+=1
            bof.save()
            BorrowRecord.objects.filter(book_id=book_id,card_id=card_id).delete()
        else:
            return render(request, 'bookmanage/card_handle.html')
    return redirect(reverse('bookmanage:card'))
def card_exit(request):
    if request.session.get('card_name',default=None) is None:
        return redirect(reverse("bookmanage:card"))
    else:
        del request.session['card_name']
        return redirect(reverse("bookmanage:card"))
def card_exists(request):
    get=request.GET
    name=get.get('card_name',default="")
    res=Card.objects.filter(name=name).count()
    return JsonResponse({"count":res})

def card_books(request):
    card_name=request.GET['card_name']
    card=Card.objects.filter(name=card_name)
    card_id=card[0].id
    brs=BorrowRecord.objects.filter(card_id=card_id)
    bookids=[br.book_id for br in brs]
    books=list(Book.objects.filter(pk__in=bookids).values())
    # print(books)
    return JsonResponse({"data":books})

def cards_query(request):
    cards=Card.objects.all().values()
    cards=list(cards)
    return JsonResponse({"data":cards})

def card_delete(request):
    card_id=request.GET['card_id']
    card=Card.objects.filter(id=card_id)
    if len(card)==0:
        return JsonResponse({"data":[0]})
    card.delete()
    del request.session['card_name']
    return JsonResponse({"data":[1]})

def card_borrowed(request):
    card_id=request.GET.get('card_id')
    count=BorrowRecord.objects.filter(card_id=card_id).count()
    return JsonResponse({"data":count})


def booktitle_query(request):
    title=request.GET.get('title',default="")
    books=Book.objects.filter(title=title).values()
    books=list(books)
    # print(books)
    return JsonResponse({"data":books})

def books_query(request):
    books=Book.objects.all().values()
    books=list(books)
    return JsonResponse({"data":books})


def bookid_cardid_exists(request):
    bookid=request.GET['book_id']
    card_name = request.session['card_name']
    card=Card.objects.filter(name=card_name)
    card_id=card[0].id
    count=BorrowRecord.objects.filter(card_id=card_id).filter(book_id=bookid).count()
    return JsonResponse({"data":count})


# manager
def manager(request):
    manager_name=request.session.get('manager_name',default=None)
    state=request.session.get('manager_state',default=0)
    if manager_name is None:
        return redirect(reverse("bookmanage:index"))

    context={"manager_name":manager_name,"title":"管理员"}
    return render(request,"bookmanage/manager.html",context)
def manager_login(request):
    return render(request,'bookmanage/manager_login.html')
def manager_login_notexists(request):
    return render(request,'bookmanage/manager_login_notexists.html')
def manager_login_handle(request):
    manager_name=request.POST.get('manager_name')
    query_res=Manager.objects.filter(name=manager_name)
    pwd=request.POST.get('manager_pwd',default="")
    pwd_en=sha1(pwd.encode('utf-8')).hexdigest()
    if pwd_en == query_res[0].password:
        request.session['manager_name']=manager_name
        request.session.set_expiry(0)
        return redirect(reverse("bookmanage:manager"))
    else:
        hrr=HttpResponseRedirect(reverse("bookmanage:index")+'?err_pwd=1&username='+manager_name)
        return hrr
def manager_exit(request):
    if request.session.get('manager_name',default=None) is None:
        return redirect(reverse("bookmanage:manager"))
    else:
        del request.session['manager_name']
        return redirect(reverse("bookmanage:manager"))
def manager_create(request):
    context={"title":"注册"}
    return render(request,"bookmanage/manager_create.html",context)
def manager_create_handle(request):
    m=Manager.create(request.POST['pwd'],request.POST['name'],request.POST['contact'])
    m.save()
    return redirect(reverse("bookmanage:index"))

def manager_add_books(request):
    import csv
    f=request.FILES['csv']
    import os
    from books.settings import BASE_DIR
    filename=os.path.join(BASE_DIR,'static/bookmanage/',f.name)
    with open(filename,"wb") as file:
        for c in f.chunks():
            file.write(c)
    with open(filename,"r",encoding='utf-8') as file:
        reader=csv.reader(file)
        reader=list(reader)
        for book in reader:
            b=Book.create(book[0],book[1],book[2],int(book[3]),book[4],float(book[5]),int(book[6]),int(book[7]))
            b.save()
    request.session['manager_state']=1
    return redirect(reverse("bookmanage:manager"))
def manager_add_card(request):
    if request.POST['card_type']=="teacher":
        type=1
    else:
        type=0
    c=Card.create(request.POST['card_name'],request.POST['card_dept'],type)
    c.save()
    # print('hello')
    return redirect(reverse("bookmanage:manager"))

def manager_add_card_handle(request):
    return render(request,'bookmanage/manager_add_card_handle.html')

def manager_exists(request):
    name=request.GET.get('name',"")
    count=Manager.objects.filter(name=name).count()
    return JsonResponse({"count":count})

def base(request):
    return render(request,'base.html')


def book_add(request):
    post=request.POST
    # print(post.get('cat'))
    book=Book.create(post.get('cat'),post.get('title'),post.get('press'),int(post.get('year')),post.get('author'),
              float(post.get('price')),int(post.get('total')),int(post.get('stock')))
    book.save()
    return redirect(reverse("bookmanage:manager"))

def books_add(request):
    request.session['manager_state']=0
    return render(request,'bookmanage/books_add.html')