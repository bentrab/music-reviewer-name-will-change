from wtforms import Form, StringField, SelectField
 
class Search_All_Form(Form):
    select = SelectField('Search for Artists or Albums:', choices=choices)
    search = StringField('')
