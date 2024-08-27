# Working with forms

## HTML forms

ในภาษา HMTL ในการที่ผู้ใช้งานจะ เขียน text เลือกตัวเลือก เลือกวันที่ และอื่นๆ แล้วส่งข้อมูลนั้นมาที่ web server จะสามารถทำได้ผ่าน form หรือ `<form>...</form>`

โดยการใช้งาน tag `<form>` นั้นจะต้องกำหนดว่า จะส่งข้อมูลไปที่ไหน (`action`) และ จะส่งข้อมูลด้วยวิธีอะไร (`method`)

โดย form นั้นจะสามารถส่งข้อมูลด้วย method เป็น `GET` หรือ `POST` เท่านั้น
- GET: จะทำการส่งข้อมูลที่กรอกในฟอร์มไปกับ url เช่น https://docs.djangoproject.com/search/?q=forms&release=1
- POST: จะทำการส่งข้อมูลที่กรอกในฟอร์มไปกับส่วน body ของ HTTP request

## Forms in Django

### The Django `Form` class

คล้ายคลึงกับ class `Model` ที่นิยามโครงสร้างตารางในฐานข้อมูล `Form` class จะนิยามหน้าตาของ form เช่นมี field อะไรบ้าง เป็นประเภทอะไร หรือก็คือนิยาม ประเภทของ `<input>` ใน form นั้นเอง นอกจากนั้นเมื่อมีการ submit ข้อมูลมา `Form` ก็จะทำการ validate ความถูกต้องของข้อมูลอีกด้วย

## Building a form in Django

### The form

เราจะเริ่มต้นด้วยการประกาศ class ที่ extend `django.forms.Form` ดังในตัวอย่าง

```python
from django import forms


class NameForm(forms.Form):
    your_name = forms.CharField(label="Your name", max_length=100)

```

### The view

กำหนด path ใน `urls.py`

```python
from django.urls import path

from myform import views

urlpatterns = [
    path("", views.get_name, name="get_name"),
]
```

สร้าง view สำหรับ render form และ รับข้อมูลจาก form ในไฟล์ `views.py`

```python
from django.http import HttpResponseRedirect
from django.shortcuts import render

from .forms import NameForm


def get_name(request):
    # if this is a POST request we need to process the form data
    if request.method == "POST":
        # create a form instance and populate it with data from the request:
        form = NameForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required
            print(form.cleaned_data["your_name"])
            return HttpResponse("Form submitted! for " + form.cleaned_data["your_name"])

    # if a GET (or any other method) we'll create a blank form
    else:
        form = NameForm()

    return render(request, "name.html", {"form": form})
```

การทำงานของ view นี้คือ ถ้าได้รับ request เป็น method GET จะทำการสร้าง form เปล่าๆ ที่เป็น instance ของ NameForm และจะถูกนำไป render ในไฟล์ name.html

ส่วนในกรณีที่รับ request เป็น method POST จะนำข้อมูลที่แนบมากับ body ของ request (request.POST) ไปสร้าง instance ของ NameForm ที่มีข้อมูลที่ถูกส่งมาข้อตอนนี้เรียกว่า "binding data to the form" จากนั้นทำการเรียก form.is_valid() เพื่อทำการ validate ค่าที่ได้รับมาว่าถูกต้องตรงตามที่กำหนดไว้ใน class NameForm หรือไม่

### The template

สร้างไฟล์ `templates/name.html`

```html
<form action="/your-name/" method="post">
    {% csrf_token %}
    {{ form }}
    <input type="submit" value="Submit">
</form>
```

เรามาทดลองใช้งานดูกัน

### More on fields

เรามาลองดูตัวอย่างที่สมจริงกว่าตัวอย่างง่ายๆ เมื่อครู่กันนะครับ

สร้าง class ContactForm ใน `forms.py`

จริงๆ ประเภท field ที่ Django มีให้เลือกนั้นมีมากมายเลย [Doc](https://docs.djangoproject.com/en/5.1/ref/forms/fields/) ยกตัวอย่างเช่น

```python
from django import forms


class ContactForm(forms.Form):
    subject = forms.CharField(max_length=100)
    message = forms.CharField(widget=forms.Textarea)
    sender = forms.EmailField()
    cc_myself = forms.BooleanField(required=False)
```

#### Widgets

Formfield แต่ละประเภทจะมีการใช้งาน `Widget` class [Doc](https://docs.djangoproject.com/en/5.1/ref/forms/widgets/)

ซึ่ง widget นี้ละที่เป็นตัวกำหนด input tag ที่เหมาะสม ยกตัวอย่างเช่น `CharField` จะมี `TextInput` widget ซึ่งจะถูกแปลงเป็น ```<input type="text">``` ใน HMTL แต่ในตัวอย่างด้านบนจะเห็นว่า field `message` เราเปลี่ยนไปเป็น widget `Textarea` แทน

#### Field data

เมื่อข้อมูลใน form ถูก submit มาจะเกิดขึ้นตอนดังนี้:

1. สร้าง instance ของ class Form โดยส่ง `request.POST` เข้าไปใน constructor
2. เรียก `is_valid()` เพื่อทำการ validate ข้อมูล
3. โดยถ้า validate ข้อมูลผ่าน เราจะสามารถเข้าถึง `cleaned_data` ได้ (โดย cleaned_data จะเป็นข้อมูลที่ submit มาที่ถูกแปลงเป็น data type ของ Python ตามที่เรากำหนดใน class Form แล้ว)

```python
from django.shortcuts import render, redirect

def contact_us(request):

    if request.method == "POST":
        # bind data to form
        form = ContactForm(request.POST)
        # validate data in the form
        if form.is_valid():
            # access cleaned_data
            subject = form.cleaned_data["subject"]
            message = form.cleaned_data["message"]
            sender = form.cleaned_data["sender"]
            cc_myself = form.cleaned_data["cc_myself"]

            recipients = ["info@example.com"]
            if cc_myself:
                recipients.append(sender)

            send_mail(subject, message, sender, recipients)
            return redirect("/thanks/")
    else:
        form = ContactForm()
    
    return render(request, "contact_us.html", {"form": form})
```

**Important: การจะเข้าถึง form.cleaned_data ได้จะต้องเรียก is_valid() ก่อนเสมอ และจะต้อง is_valid() == True**
