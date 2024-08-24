# Widgets

ในขณะที่ `Form` fields ใช้ในการจัดการการ validate ข้อมูล input ของ form ซึ่งจะใช้งานใน "view" แต่ `Widget` ใช้ในการ render HTML ของ input ใน form ซึ่งจะใช้งานใน "template" เป็นหลัก

โดยปกติเมื่อเราทำการกำหนด field ใน form Django จะทำการเลือกใช้งาน widget ที่เหมาะสมกับ field นั้นๆ ให้เอง ใน doc ของ Django จะระบุไว้ว่า form field ไหนใช้ widget อะไร [Doc](https://docs.djangoproject.com/en/5.1/ref/forms/fields/#built-in-fields)

ยกตัวอย่างเช่น

**BooleanField**

class BooleanField(**kwargs)

    - Default widget: CheckboxInput
    - Empty value: False
    - Normalizes to: A Python True or False value.
    - Validates that the value is True (e.g. the check box is checked) if the field has required=True.
    - Error message keys: required

แต่เราก็สามารถเปลี่ยนได้ เช่น

```python
class CommentForm(forms.Form):
    name = forms.CharField()
    url = forms.URLField()
    comment = forms.CharField(widget=forms.Textarea)
```

## Setting arguments for widgets

Widget บางตัวมี argument ที่เราสามารถกำหนดได้

```python
from django import forms

BIRTH_YEAR_CHOICES = ["1980", "1981", "1982"]
FAVORITE_COLORS_CHOICES = {
    "blue": "Blue",
    "green": "Green",
    "black": "Black",
}


class SimpleForm(forms.Form):
    birth_year = forms.DateField(
        widget=forms.SelectDateWidget(years=BIRTH_YEAR_CHOICES)
    )
    favorite_colors = forms.MultipleChoiceField(
        required=False,
        widget=forms.CheckboxSelectMultiple,
        choices=FAVORITE_COLORS_CHOICES,
    )
```

## Styling widget instances

เราสามารถกำหนด css หรือ css-class ของ widget ได้เพื่อปรับเปลี่ยนการแสดงผล

```python
class CommentForm(forms.Form):
    name = forms.CharField(widget=forms.TextInput(attrs={"class": "special"}))
    url = forms.URLField()
    comment = forms.CharField(widget=forms.TextInput(attrs={"size": "40"}))
```

หรือสำหรับ field ที่ไม่ได้ประกาศตรงๆ ใน form เช่นกรณี ModelForm ให้ทำการกำหนดใน __init__()

```python
class CommentForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["name"].widget.attrs.update({"class": "special"})
        self.fields["comment"].widget.attrs.update(size="40")
```
