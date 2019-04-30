from wtforms import Form, StringField, SelectField
 
class Last_FM_Form(Form):
    choices = [('Artist', 'Artist'),
               ('Album', 'Album')]
    select = SelectField('Search for music:', choices=choices)
    search = StringField('')
