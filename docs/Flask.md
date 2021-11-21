# Flask Essential Training

## Introduction

### Pros and Cons of Flask

|__Pros__|__Cons__|
|---|---|
|- Easy to get started| - Extremely limited|
|- Very customizable|- No database help|
|- Web Server Gateway Interface (WSGI) compatible| | 

### What you should know

- Python 3 (3.8)
- Pip 3 (3.19.2)
- Basic HTML

### Terminal Vs Command Prompt

|Terminal|Command Prompt|
|---|---|
|ls|dir|
|pwd|echo %cd%|
|export FLASK_APP=hello|set FLASK_APP=hello|


## First Flask APP

### Install Flask and Pipenv

Install pipenv

```
pip3 install pipenv
```
Below command will create virtual environment.  
```
pipenv install
```
Below command to enter into virtual environment shell.  
```
pipenv shell
```
type __exit__ in the pipenv shell to exit from virtual environment shell.  

```python
pipenv shell

pipenv install flask
```

### Create your first route in a Flask project

__hello.py__

```python
from flask import Flask

app = Flask(__name__)

print(__name__)
```

How to execute
```
export FLASK_APP=hello
flask run
```

__hello.py__

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')

def home():
    return 'Hello Flask!'
```

How to execute
```
export FLASK_APP=hello
flask run
```

### Flask's development environment

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return 'Hello Flask!'

@app.route('/about')
def about():
    return 'This is url-shortener'
```
By default flask run's in production, if code is change it will reload automatically.  
for this process, we are using environment for auto-refresh.  
```
export FLASK_APP=hello
export FLASK_ENV=development
flask run
```
__app.py__

```python3
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return 'Hello Flask!'

@app.route('/about')
def about():
    return 'This is url-shortener'
```
Command to execute
```
export FLASK_ENV=development
flask run
```

### Page templates in Flask with Jinja  

https://palletsprojects.com/p/jinja/  

__app.py__

```python3
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/about')
def about():
    return 'This is url-shortener'
```

__templates/home.html__ 

```html
<h1>This is home</h1>
```
Command to execute
```
export FLASK_ENV=development
flask run
```

__app.py__

```python
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html',name='Hemanth')

@app.route('/about')
def about():
    return 'This is url-shortener'
```

__home.html__

```html
<h1>This is home</h1>
<h2>{{ name }}</h2>
```

### Passing data into Flask apps with forms

__app.py__

```python
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/about')
def about():
    return 'This is url-shortener'
```

__home.html__

```html
<h1>URL Shortener</h1>

<form action="your-url">
  <label for="url">Website URL</label>
    <input type="url" name="url" value="" required>
    <br>
    <label for="code">Short Name</label>
    <input type="text" name="code" value="" required>
    <br>
    <input type="submit" value="Shorten">
</form>
```

### Passing form variables to other routes in Flask

__app.py__
```python3
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/your-url')
def your_url():
    return render_template('your_url.html', code=request.args['code'])
```

__templates\your_url.html__

```html
<h1>Your URL</h1>

<h2>{{ code }}</h2>
```

### Using GET and POST requests in Flask  

__By default flask used GET__

__app.py__

```python3
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        return render_template('your_url.html', code=request.form['code'])
    else:
        return 'This is not valid'
```

__templates/home.html__

```html
<h1>URL Shortener</h1>

<form action="your-url" method="post">
  <label for="url">Website URL</label>
    <input type="url" name="url" value="" required>
    <br>
    <label for="code">Short Name</label>
    <input type="text" name="code" value="" required>
    <br>
    <input type="submit" value="Shorten">
</form>
```

## Data Flow in Flask

### Using redirect and url_for for error handling

__app.py__

```python
from flask import Flask, render_template, request, redirect,url_for

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        return render_template('your_url.html', code=request.form['code'])
    else:
        return redirect(url_for('home'))
```

### Saving to a JSON file

__app.py__

```python
from flask import Flask, render_template, request, redirect,url_for
import json

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        urls = {}
        urls[request.form['code']] = {'url':request.form['url']}
        with open('urls.json','w') as url_file:
            json.dump(urls, url_file)
        return render_template('your_url.html', code=request.form['code'])
    else:
        return redirect(url_for('home'))
```

### Parsing a JSON file for conflicting entries  

```python
from flask import Flask, render_template, request, redirect,url_for
import json
import os.path

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        urls = {}

        if os.path.exists('urls.json'):
            with open('urls.json') as urls_file:
                urls = json.load(urls_file)

        if request.form['code'] in urls.keys():
            return redirect(url_for('home'))

        urls[request.form['code']] = {'url':request.form['url']}
        with open('urls.json','w') as url_file:
            json.dump(urls, url_file)
        return render_template('your_url.html', code=request.form['code'])
    else:
        return redirect(url_for('home'))
```

### Alerting users with message flashing

__app.py__
```python
from flask import Flask, render_template, request, redirect,url_for, flash
import json
import os.path

app = Flask(__name__)
app.secret_key = 'hemanthbitra'

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        urls = {}

        if os.path.exists('urls.json'):
            with open('urls.json') as urls_file:
                urls = json.load(urls_file)

        if request.form['code'] in urls.keys():
            flash('That short name has already been taken, Please select anther name.')
            return redirect(url_for('home'))

        urls[request.form['code']] = {'url':request.form['url']} 
        with open('urls.json','w') as url_file:
            json.dump(urls, url_file)
        return render_template('your_url.html', code=request.form['code'])
    else:
        return redirect(url_for('home'))
```

__home.html__

```html
<h1>URL Shortener</h1>

{% for message in get_flashed_messages() %}
<h2>{{ message }}</h2>
{% endfor %}

<form action="your-url" method="post">
  <label for="url">Website URL</label>
    <input type="url" name="url" value="" required>
    <br>
    <label for="code">Short Name</label>
    <input type="text" name="code" value="" required>
    <br>
    <input type="submit" value="Shorten">
</form>
```

### File uploads from users

__app.py__

```python3
from flask import Flask, render_template, request, redirect,url_for, flash
import json
import os.path
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key = 'hemanthbitra'

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        urls = {}

        if os.path.exists('urls.json'):
            with open('urls.json') as urls_file:
                urls = json.load(urls_file)

        if request.form['code'] in urls.keys():
            flash('That short name has already been taken, Please select anther name.')
            return redirect(url_for('home'))

        if 'url' in request.form.keys():
            urls[request.form['code']] = {'url': request.form['url']}
        else:
            f = request.files['file']
            full_name = request.form['code'] + secure_filename(f.filename())
            f.save('/workspaces/vscode-remote-try-python-master' + full_name)
            urls[request.form['code']] = {'file': full_name}

        urls[request.form['code']] = {'url':request.form['url']} 
        with open('urls.json','w') as url_file:
            json.dump(urls, url_file)
        return render_template('your_url.html', code=request.form['code'])
    else:
        return redirect(url_for('home'))
```
__home.html__

```html
<h1>URL Shortener</h1>

{% for message in get_flashed_messages() %}
<h2>{{ message }}</h2>
{% endfor %}

<form action="your-url" method="post">
  <label for="url">Website URL</label>
    <input type="url" name="url" value="" required>
    <br>
    <label for="code">Short Name</label>
    <input type="text" name="code" value="" required>
    <br>
    <input type="submit" value="Shorten">
</form>

<form action="your-url" method="post" enctype="multipart/form-data">
  <label for="file">File</label>
    <input type="file" name="file" value="" required>
    <br>
    <label for="code">Short Name</label>
    <input type="text" name="code" value="" required>
    <br>
    <input type="submit" value="Shorten">
</form>
```
### Variable rules in URLs

__app.py__
```python3
from flask import Flask, render_template, request, redirect,url_for, flash
import json
import os.path
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key = 'hemanthbitra'

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        urls = {}

        if os.path.exists('urls.json'):
            with open('urls.json') as urls_file:
                urls = json.load(urls_file)

        if request.form['code'] in urls.keys():
            flash('That short name has already been taken, Please select anther name.')
            return redirect(url_for('home'))

        if 'url' in request.form.keys():
            urls[request.form['code']] = {'url': request.form['url']}
        else:
            f = request.files['file']
            full_name = request.form['code'] + secure_filename(f.filename())
            f.save('/workspaces/vscode-remote-try-python-master' + full_name)
            urls[request.form['code']] = {'file': full_name}

        urls[request.form['code']] = {'url':request.form['url']} 
        with open('urls.json','w') as url_file:
            json.dump(urls, url_file)
        return render_template('your_url.html', code=request.form['code'])
    else:
        return redirect(url_for('home'))

@app.route('/<string:code>')
def redirect_to_url(code):
    if os.path.exists('urls.json'):
        with open('urls.json') as urls_file:
            urls = json.load(urls_file)
            if code in urls.keys():
                if 'url' in urls[code].keys():
                    return redirect(urls[code]['url'])
```

### Working with static files  

__app.py__
```python
from flask import Flask, render_template, request, redirect,url_for, flash
import json
import os.path
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key = 'hemanthbitra'

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        urls = {}

        if os.path.exists('urls.json'):
            with open('urls.json') as urls_file:
                urls = json.load(urls_file)

        if request.form['code'] in urls.keys():
            flash('That short name has already been taken, Please select anther name.')
            return redirect(url_for('home'))

        if 'url' in request.form.keys():
            urls[request.form['code']] = {'url': request.form['url']}
        else:
            f = request.files['file']
            full_name = request.form['code'] + secure_filename(f.filename())
            f.save('/workspaces/vscode-remote-try-python-maste/static/user_files/' + full_name)
            urls[request.form['code']] = {'file': full_name}

        urls[request.form['code']] = {'url':request.form['url']} 
        with open('urls.json','w') as url_file:
            json.dump(urls, url_file)
        return render_template('your_url.html', code=request.form['code'])
    else:
        return redirect(url_for('home'))

@app.route('/<string:code>')
def redirect_to_url(code):
    if os.path.exists('urls.json'):
        with open('urls.json') as urls_file:
            urls = json.load(urls_file)
            if code in urls.keys():
                if 'url' in urls[code].keys():
                    return redirect(urls[code]['url'])
                else:
                    return redirect(url_for('static', filename='user_files/' + urls[code]['file']))
```
flask default static folder
```shell
mkdir -p static/user_files
```

### Displaying custom error pages

__app.py__
```python3
from flask import Flask, render_template, request, redirect,url_for, flash, abort
import json
import os.path
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key = 'hemanthbitra'

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        urls = {}

        if os.path.exists('urls.json'):
            with open('urls.json') as urls_file:
                urls = json.load(urls_file)

        if request.form['code'] in urls.keys():
            flash('That short name has already been taken, Please select anther name.')
            return redirect(url_for('home'))

        if 'url' in request.form.keys():
            urls[request.form['code']] = {'url': request.form['url']}
        else:
            f = request.files['file']
            full_name = request.form['code'] + secure_filename(f.filename())
            f.save('/workspaces/vscode-remote-try-python-maste/static/user_files/' + full_name)
            urls[request.form['code']] = {'file': full_name}

        urls[request.form['code']] = {'url':request.form['url']} 
        with open('urls.json','w') as url_file:
            json.dump(urls, url_file)
        return render_template('your_url.html', code=request.form['code'])
    else:
        return redirect(url_for('home'))

@app.route('/<string:code>')
def redirect_to_url(code):
    if os.path.exists('urls.json'):
        with open('urls.json') as urls_file:
            urls = json.load(urls_file)
            if code in urls.keys():
                if 'url' in urls[code].keys():
                    return redirect(urls[code]['url'])
                else:
                    return redirect(url_for('static', filename='user_files/' + urls[code]['file']))
    return abort(404)

@app.errorhandler(404)
def page_not_found(error):
    return render_template('page_not_found.html'), 404
```

__page_not_found.html__

```html
<h1> Page Not found</h1>

<p>We couldn't find what you are looking for Come visit our homepage :)</p>

<p><a href="{{ url_for('home') }}">Home</a></p>
```

## Templates and Styple

### Implementing sessions and cookies  

__app.py__

```python
from flask import Flask, render_template, request, redirect,url_for, flash, abort, session
import json
import os.path
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key = 'hemanthbitra'

@app.route('/')
def home():
    return render_template('home.html', codes=session.keys())

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        urls = {}

        if os.path.exists('urls.json'):
            with open('urls.json') as urls_file:
                urls = json.load(urls_file)

        if request.form['code'] in urls.keys():
            flash('That short name has already been taken, Please select anther name.')
            return redirect(url_for('home'))

        if 'url' in request.form.keys():
            urls[request.form['code']] = {'url': request.form['url']}
        else:
            f = request.files['file']
            full_name = request.form['code'] + secure_filename(f.filename())
            f.save('/workspaces/vscode-remote-try-python-maste/static/user_files/' + full_name)
            urls[request.form['code']] = {'file': full_name}

        urls[request.form['code']] = {'url':request.form['url']} 
        with open('urls.json','w') as url_file:
            json.dump(urls, url_file)
            session[request.form['code']] = True
        return render_template('your_url.html', code=request.form['code'])
    else:
        return redirect(url_for('home'))

@app.route('/<string:code>')
def redirect_to_url(code):
    if os.path.exists('urls.json'):
        with open('urls.json') as urls_file:
            urls = json.load(urls_file)
            if code in urls.keys():
                if 'url' in urls[code].keys():
                    return redirect(urls[code]['url'])
                else:
                    return redirect(url_for('static', filename='user_files/' + urls[code]['file']))
    return abort(404)

@app.errorhandler(404)
def page_not_found(error):
    return render_template('page_not_found.html'), 404
```
__home.html__
```html
<h1>URL Shortener</h1>

{% for message in get_flashed_messages() %}
<h2>{{ message }}</h2>
{% endfor %}

<form action="your-url" method="post">
  <label for="url">Website URL</label>
    <input type="url" name="url" value="" required>
    <br>
    <label for="code">Short Name</label>
    <input type="text" name="code" value="" required>
    <br>
    <input type="submit" value="Shorten">
</form>

<form action="your-url" method="post" enctype="multipart/form-data">
  <label for="file">File</label>
    <input type="file" name="file" value="" required>
    <br>
    <label for="code">Short Name</label>
    <input type="text" name="code" value="" required>
    <br>
    <input type="submit" value="Shorten">
</form>

{% if codes %}
<h2>Codes you have created</h2>
<ul>
  {% for code in codes %}
  <a href="{{ url_for('redirect_to_url',code=code) }}">
  <li>{{ code }}</li>
  </a>
  {% endfor %}
</ul>
{% endif %}
```

### Creating JSON APIs

```python
from flask import Flask, render_template, request, redirect,url_for, flash, abort, session, jsonify
import json
import os.path
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key = 'hemanthbitra'

@app.route('/')
def home():
    return render_template('home.html', codes=session.keys())

@app.route('/your-url', methods=['GET','POST'])
def your_url():
    if request.method == 'POST':
        urls = {}

        if os.path.exists('urls.json'):
            with open('urls.json') as urls_file:
                urls = json.load(urls_file)

        if request.form['code'] in urls.keys():
            flash('That short name has already been taken, Please select anther name.')
            return redirect(url_for('home'))

        if 'url' in request.form.keys():
            urls[request.form['code']] = {'url': request.form['url']}
        else:
            f = request.files['file']
            full_name = request.form['code'] + secure_filename(f.filename())
            f.save('/workspaces/vscode-remote-try-python-maste/static/user_files/' + full_name)
            urls[request.form['code']] = {'file': full_name}

        urls[request.form['code']] = {'url':request.form['url']} 
        with open('urls.json','w') as url_file:
            json.dump(urls, url_file)
            session[request.form['code']] = True
        return render_template('your_url.html', code=request.form['code'])
    else:
        return redirect(url_for('home'))

@app.route('/<string:code>')
def redirect_to_url(code):
    if os.path.exists('urls.json'):
        with open('urls.json') as urls_file:
            urls = json.load(urls_file)
            if code in urls.keys():
                if 'url' in urls[code].keys():
                    return redirect(urls[code]['url'])
                else:
                    return redirect(url_for('static', filename='user_files/' + urls[code]['file']))
    return abort(404)

@app.errorhandler(404)
def page_not_found(error):
    return render_template('page_not_found.html'), 404

@app.route('/api')
def session_api():
    return jsonify(list(session.keys()))
```

### Template blocks and base templates

__templates/base.html__

```html
<head>
    <title>{% block title %}{% endblock %}</title>
</head>

{% for message in get_flashed_messages() %}
<h2>{{ message }}</h2>
{% endfor %}

{% block main %}
{% endblock %}
```

__templates/home.html__
```html
{% extends 'base.html' %}

{% block title %}URL Shortener{% endblock %}

{% block main %}

<h1>URL Shortener</h1>



<form action="your-url" method="post">
  <label for="url">Website URL</label>
    <input type="url" name="url" value="" required>
    <br>
    <label for="code">Short Name</label>
    <input type="text" name="code" value="" required>
    <br>
    <input type="submit" value="Shorten">
</form>

<form action="your-url" method="post" enctype="multipart/form-data">
  <label for="file">File</label>
    <input type="file" name="file" value="" required>
    <br>
    <label for="code">Short Name</label>
    <input type="text" name="code" value="" required>
    <br>
    <input type="submit" value="Shorten">
</form>

{% if codes %}
<h2>Codes you have created</h2>
<ul>
  {% for code in codes %}
  <a href="{{ url_for('redirect_to_url',code=code) }}">
  <li>{{ code }}</li>
  </a>
  {% endfor %}
</ul>
{% endif %}

{% endblock %}
```

__templates/page_not_found.html__

```html
{% extends 'base.html' %}

{% block title %}Page Not found{% endblock %}

{% block main %}

<h1> Page Not found</h1>

<p>We couldn't find what you are looking for Come visit our homepage :)</p>

<p><a href="{{ url_for('home') }}">Home</a></p>

{% endblock %}
```

__templates/your_url.html__

```html
{% extends 'base.html' %}

{% block title %}URL for "{{ code }}"{% endblock %}

{% block main %}

<h1>Your URL</h1>

<h2>{{ code }}</h2>

{% endblock %}
```

### Templating Flask with Bootstrap

Download the example file copuy file from below path and past in respective directory  

Ex_Files_Flask_EssT\Ex_Files_Flask_EssT\ExerciseFiles\04_01\url-shortener\static  
Ex_Files_Flask_EssT\Ex_Files_Flask_EssT\ExerciseFiles\04_01\url-shortener\templates  

## Deployment and Testing  

### Blueprints and views for organization
Refer to urlshort_04_01.zip

### Testing your Flask app
Refer to urlshort_04_02.zip

### WSGI servers and how they work

__WSGI (Web Server Gateway Interface)__

|Frameworks|Servers|
|---|---|
|Flask|Gunicorn|
|Django|uWSGI|

### Deploy your Flask app with Gunicorn  

```
export FLASK_APP=urlshort
flask run --host=0.0.0.0
```

Running app without using gunicorn  

```
pip install gunicorn
```

```
gunicorn "urlshort:craete_app()" -b 0.0.0.0
```

By default it run's on 8000 port  

```
sudo apt install nginx
```
we use nginx for reverse proxy  

Command to check nginx status   
```
systemctl status nginx 
```

Command to configure nginx for reverse proxy  

```
vi /etc/nginx/site-enabled/default
```

inside the default file, we add below data.  

```
  server {
    listen 80;
    server_name example.org;
    access_log  /var/log/nginx/example.log;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
  }
```
Website for reference: https://gunicorn.org/#deployment  

Command to run the flask app with gunicorn in demon mode.  
This make sure app will run even through exited from terminal.  
```
gunicorn "urlshort:craete_app()" -b 0.0.0.0 --daemon
```
