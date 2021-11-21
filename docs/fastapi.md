# Tutorial 1

__Pre-requiste__  
```python
pip install virtualenv fastapi uvicorn
```

__main.py__  
```python
from fastapi import FastAPI

app = FastAPI()

@app.get('/')

async def hello_world():
    return {"Hello":"World"}
```

__Command to execute__

```python
uvicorn main:app --reload
```

__Output__

```python
$ curl  http://127.0.0.1:8000/
{"Hello":"World"}
```

# Tutorial 2


__main.py__

```python
from typing import Optional
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
async def hello_world():
    return {'Hello' : 'World'}

@app.get("/component/{component_id}") # path parameter
async def get_component(component_id: int):
    return {"component_id": component_id}

@app.get("/component/")
async def read_component(number: int, text: Optional[str] = None):  # query parameter
    return {"number": number, "text": text}
```

__Command to execute__

```python
uvicorn main:app --reload
```

__Url with swagger api__

http://127.0.0.1:8000/docs

__url with redoc__

http://127.0.0.1:8000/redoc

__Command to executes__

```bash
$ curl  http://127.0.0.1:8000/component/1
{"component_id":1}
```

```bash
$ curl  -X GET "http://127.0.0.1:8000/component/?number=1&text=this%20is%20fastapi"
{"number":1,"text":"this is fastapi"}
```

# Tutorial 3

__main.py__

```python
from typing import Optional
from fastapi import FastAPI
from pydantic import BaseModel

class Package(BaseModel):
    name: str
    number: str
    description: Optional[str] = None

app = FastAPI()

@app.get('/')
async def hello_world():
    return {'Hello' : 'World'}

@app.post("/package/{priority}")
async def make_package(priority: int,package: Package, value: bool):
    return {"priority": priority, **package.dict(),"value": value}
```

__Command to execute__

```python
uvicorn main:app --reload
```

# Tutorial 4

__main.py__

```python
from typing import Optional
from fastapi import FastAPI
from pydantic import BaseModel

class PackageIn(BaseModel):
    secret_id: int
    name: str
    number: str
    description: Optional[str] = None

class Package(BaseModel):
    name: str
    number: str
    description: Optional[str] = None

app = FastAPI()

@app.get('/')
async def hello_world():
    return {'Hello' : 'World'}

@app.post("/package/", response_model=Package, response_model_exclude={"description"})
async def make_package(package: PackageIn):
    return package
```

__Command to execute__

```python
uvicorn main:app --reload
```

# Tutorial 5

__main.py__

```python
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional, List

class Todo(BaseModel):

    name: str
    due_date: str
    description: str

app = FastAPI(title="Todo API")

# Create, Read, Update, Delete

store_todo =[]

@app.get('/')

async def home():
    return {"Hello":"World"}

@app.post('/todo/')
async def create_todo(todo: Todo):
    store_todo.append(todo)
    return todo

@app.get('/todo/', response_model=List[Todo])
async def get_all_todos():
    return store_todo

@app.get('/todo/{id}')
async def get_todo(id: int):
    try:
        return store_todo[id]

    except:
        raise HTTPException(status_code=404, detail="Todo Not Found")

@app.put('/todo/{id}')
async def update_todo(id: int, todo: Todo):
    try:
        store_todo[id] = todo
        return store_todo[id]

    except:
        raise HTTPException(status_code=404, detail="Todo Not Found")

@app.delete('/todo/{id}')
async def delete_todo(id: int, todo: Todo):
    try:
        obj  = store_todo[id]
        store_todo.popp[id]
        return obj

    except:
        raise HTTPException(status_code=404, detail="Todo Not Found")

```
__Command to execute__

```python
uvicorn main:app --reload
```
# Tutorial 6

__Pre-requiste__  
```python
pip install python-multipart
```

__main.py__

```python
from fastapi import FastAPI, Form

app = FastAPI()

@app.post("/language/")
async def language(name: str = Form(...), type: str = Form(...)):
    return {"name": name, "type": type}
```

__Command to execute__

```python
uvicorn main:app --reload
```

# Tutorial 7 Part1

__Pre-requiste__  
```python
pip install tortoise-orm
```
__models.py__

```python3
from tortoise import fields, models

from tortoise.contrib.pydantic import pydantic_model_creator

class Todo(models.Model):
    
    id = fields.IntField(pk=True)
    todo = fields.CharField(max_length=250)
    due_date = fields.CharField(max_length=250)
    
    class PydanticMeta:
        pass
    
Todo_Pydantic = pydantic_model_creator(Todo, name="Todo")
TodoIn_Pydantic = pydantic_model_creator(Todo, name="TodoIn", exclude_readonly=True)
```

# Tutorial Part 2

```python3
from fastapi import FastAPI, HTTPException
from models import Todo, TodoIn_Pydantic, Todo_Pydantic
from tortoise.contrib.fastapi import HTTPNotFoundError, register_tortoise
from pydantic import BaseModel

class Message(BaseModel):
    message: str

app = FastAPI()

@app.get('/')
async def read_root():
    return {"Hello": "World"}

@app.post('/todo', response_model=Todo_Pydantic)
async def create(todo: TodoIn_Pydantic):
    obj = await Todo.create(**todo.dict(exclude_unset=True))
    return await Todo_Pydantic.from_tortoise_orm(obj)

@app.get('/todo/{id}', response_model=Todo_Pydantic, responses={404: {"model": HTTPNotFoundError}})
async def get_one(id: int):
    return await Todo_Pydantic.from_queryset_single(Todo.get(id=id))

@app.put("/todo/{id}", response_model=Todo_Pydantic, responses={404: {"model": HTTPNotFoundError}})
async def update(id: int, todo: TodoIn_Pydantic):
    await Todo.filter(id=id).update(**todo.dict(exclude_unset=True))
    return await Todo_Pydantic.from_queryset_single(Todo.get(id=id))

@app.delete("/todo/{id}", response_model=Message, responses={404: {"model": HTTPNotFoundError}})
async def delete(id: int):
    delete_obj = await Todo.filter(id=id).delete()
    if not delete_obj:
        raise HTTPException(status_code=404, detail="This todo is not found.")
    return Message(message="Succesfully Deleted")

register_tortoise(
    app,
    db_url="sqlite://store.db",
    modules={'models': ['models']},
    generate_schemas=True,
    add_exception_handlers=True,
)
```
__Command to execute__

```python
uvicorn main:app --reload
```
# Tutorial 8

__Pre-requiste__  
```python
pip install jinja2
```

__main.py__  
```python
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

app = FastAPI()

templates = Jinja2Templates(directory="templates")

@app.get("/book/{id}", response_class=HTMLResponse)
async def read(request: Request, id: int):
    return templates.TemplateResponse("index.html", {"request": request, "id": id})
```
__templates/index.html__
```html
<html>
    <head>
        <title>Book Number {{ id }}</title>
    </head>
    <body>
        <h1>Book Number</h1>
        <h4>Book Number: {{ id }}</h4>
    </body>
</html>
```

__Command to execute__

```python
uvicorn main:app --reload
```

# Tutorial 9

__main.py__

```python3
from typing import List

from fastapi import FastAPI, Depends
from pydantic import BaseModel, Field
import databases
import sqlalchemy
from datetime import datetime

DATABASE_URL = "sqlite:///./store.db"

metadata = sqlalchemy.MetaData()

database = databases.Database(DATABASE_URL)

register = sqlalchemy.Table(
    "register",
    metadata,
    sqlalchemy.Column("id", sqlalchemy.Integer, primary_key=True),
    sqlalchemy.Column("name", sqlalchemy.String(500)),
    sqlalchemy.Column("date_created", sqlalchemy.DateTime())
)

engine = sqlalchemy.create_engine(
    DATABASE_URL, connect_args={"check_same_thread": False}
)

metadata.create_all(engine)

app = FastAPI()

@app.on_event("startup")
async def connect():
    await database.connect()

@app.on_event("shutdown")
async def shutdown():
    await database.disconnect()

class RegisterIn(BaseModel):
    name: str = Field(...)

class Register(BaseModel):
    id: int
    name: str
    date_created: datetime 

@app.post('/register/', response_model=Register)
async def create(r: RegisterIn = Depends()):
    query = register.insert().values(
        name=r.name,
        date_created=datetime.utcnow()
    )
    record_id = await database.execute(query)
    query = register.select().where(register.c.id == record_id)
    row = await database.fetch_one(query)
    return {**row}

@app.get('/register/{id}', response_model=Register)
async def get_one(id: int):
    query = register.select().where(register.c.id == id)
    user = await database.fetch_one(query)
    return {**user}

@app.get('/register/', response_model=List[Register])
async def get_all():
    query = register.select()
    all_get = await database.fetch_all(query)
    return all_get

@app.put('/register/{id}', response_model=Register)
async def update(id: int, r: RegisterIn = Depends()):

    query = register.update().where(register.c.id == id).values(
        name=r.name,
        date_created=datetime.utcnow(),
    )
    record_id = await database.execute(query)
    query = register.select().where(register.c.id == record_id)
    row = await database.fetch_one(query)
    return {**row}

@app.delete("/register/{id}", response_model=Register)
async def delete(id: int):
    query = register.delete().where(register.c.id == id)
    return await database.execute(query)

```
