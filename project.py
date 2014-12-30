#-*- coding: utf-8 -*-


import web
from datetime import datetime



urls = (
    '/', 'index',
    '/newMovies', 'newMovies',
    '/movie/(.*)/(.*)', 'movie',
    '/about', 'about',
    '/add/movie', 'add_movie',
    '/add/director', 'add_director',
    '/add/actor', 'add_actor',
    '/add/writer', 'add_writer',
    '/add/country', 'add_country',
    '/add/productor', 'add_productor',
    '/movies', 'movies',
    '/directors', 'directors',
    '/director/(.*)/(.*)', 'director',
    '/writers', 'writers',
    '/comingSoon', 'comingSoon',
    '/search', 'search',

)


render = web.template.render('templates/', base='base')
db = web.database(dbn='mysql', user='root', pw='', db='movies')


menu_items = [ ("/movies", "Movies"), ("/newMovies", "New Movies"),  \
               ("/directors", "Directors"), ("/writers", "Writers"), \
               ("/comingSoon", "Coming Soon"), ("/about", "About") ]



def required(input_str):
    input_str = clean_str(input_str)
    return input_str != ""

def clean_str(input_str):
    result = input_str.strip()
    words = result.split()
    words = [w.capitalize() for w in words ]
    result = " ".join(words)
    return(result)

def is_int(number):
    try:
        result= int(number)
        return True
    except ValueError:
        return False

    
def is_float(input_str):
    try:
        result = float(input_str)
        return True
    except ValueError:
        return False

def date_time(date_text):
    try:
        datetime.strptime(date_text, '%Y-%m-%d')
        return True
    except ValueError:
        return False


def clean_video(video):
    result=video.split('=')[-1]
    return(result)

def check_video(video):
    try:
            if 'www.youtube.com' in video:
                return True
    except ValueError:
        return False

class search:
    def GET(self):
        inp = web.input()
        search = inp.get("search", None)
        if search == None:
            raise web.seeother('/')
        results = db.query("SELECT * FROM movies AS m WHERE m.title LIKE $m ",vars={'m':search+"%"})
        return render.search(results);
         
class index:
    def GET(self):
       
       movies = db.select("movies")
       
       genre = db.query("SELECT * FROM genre WHERE genre_id <=10;", vars=locals() )
       genres = db.query("SELECT * FROM genre WHERE genre_id <=20 and genre_id >=11;", vars=locals() )
       return render.index(movies, genre, genres)
       



"""MOVIES"""

             
class movies:
    def GET(self):
        movies = list(db.select("movies"))
        title = [(row.movie_id, row.title) for row in movies]

        inp = web.input()
        page = inp.page if hasattr(inp, 'page') else 1
        perpage = 5
        offset=(int(page)-1)*perpage
        movie=db.select("movies", order="movie_id", offset=offset, limit=perpage)
        moviecount = db.query("SELECT COUNT(*) AS count FROM movies")[0]
        pages = moviecount.count / perpage
        return render.movies(movie, title, pages)
        
class movie:

     
    def GET(self, movie_name, movie_id):
       movie_id = int(movie_id)
       movie = db.select("movies", where="movie_id=$movie_id", vars=locals())[0]
       director_id = movie.director_id
       director = db.select("director", where="director_id=$director_id", vars=locals())[0]

       
       """genre"""
       genre_rows = db.select("movie_genre", where="movie_id=$movie_id", vars=locals())
       genre_labels = list(db.select("genre"))
       genre_dict= {}
       for row in genre_labels:
           genre_dict[row.genre_id] = row.genre
       genre_list =[]
       for row in genre_rows:
           genre_list.append(genre_dict[row.genre_id])
       genre_str = ", ".join(genre_list)


       """actors"""
       actor_rows = db.select("movie_actor", where="movie_id=$movie_id", vars=locals())
       actor_labels =list(db.select("actors"))
       actor_dict = {}
       for row in actor_labels:
           actor_dict[row.actor_id] = row.name
       actor_list=[]
       for row in actor_rows:
           actor_list.append(actor_dict[row.actor_id])
       actor_str = ", ".join(actor_list)

       """writers"""
       writer_rows = db.select("movie_writer", where="movie_id=$movie_id", vars=locals())
       writer_labels =list(db.select("writers"))
       writer_dict = {}
       for row in writer_labels:
           writer_dict[row.writer_id] = row.name
       writer_list=[]
       for row in writer_rows:
           writer_list.append(writer_dict[row.writer_id])
       writer_str = ", ".join(writer_list)

       """productors"""
       productor_rows = db.select("movie_productor", where="movie_id=$movie_id", vars=locals())
       productor_labels =list(db.select("productors"))
       productor_dict = {}
       for row in productor_labels:
           productor_dict[row.productor_id] = row.name
       productor_list=[]
       for row in productor_rows:
           productor_list.append(productor_dict[row.productor_id])
       productor_str = ", ".join(productor_list)
       
       """country"""
       country_rows = db.select("movie_country", where="movie_id=$movie_id", vars=locals())
       country_labels =list(db.select("countries"))
       country_dict = {}
       for row in country_labels:
           country_dict[row.country_id] = row.country
       country_list=[]
       for row in country_rows:
           country_list.append(country_dict[row.country_id])
       country_str = ", ".join(country_list)
       
       
       from urllib import quote_plus
       return render.movie( movie, quote_plus, genre_str,director, actor_str, writer_str, productor_str, country_str)

class add_movie:
    
    director_rows = list(db.select("director", order="name"))
    director = [ (row.director_id, row.name) for row in director_rows ]
    actor_rows = list(db.select("actors" , order="name"))
    actors = [(row.actor_id, row.name) for row in actor_rows]
    writer_rows = list(db.select("writers", order="name"))
    writers = [(row.writer_id, row.name) for row in writer_rows]
    productor_rows = list(db.select("productors", order="name"))
    productors = [(row.productor_id, row.name) for row in productor_rows]
    country_rows = list(db.select("countries", order="country"))
    country = [ (row.country_id, row.country) for row in country_rows]
    required_field = web.form.Validator('Fill in the blanks!', required)
    check_integer = web.form.Validator('Please an integer', is_int)
    check_date = web.form.Validator('Incorrect data format, should be YYYY-MM-DD', date_time)
    check_year = web.form.Validator('Incorrect, shold be greater than 1900',lambda s: int(s)>1900)
    genres_rows = list(db.select("genre"))
    genres = [ (row.genre_id, row.genre) for row in genres_rows ]

    
    def check_director_movies(inp):
      director_id = inp.director_id
      title = clean_str(inp.title)
      director_movie_rows = db.query("SELECT m.title FROM movies AS m WHERE m.director_id=$director_id", vars=locals())
      director_movie_titles = [ row.title for row in director_movie_rows ]
      return title not in director_movie_titles
    
    movie_add_form = web.form.Form( 
      web.form.Textbox('title',required_field, description="Title"),
      web.form.Textbox('release_date',required_field,check_date,description="Release Date"),
      web.form.Textbox('year',check_integer,check_year, description="Production Year"),
      web.form.Dropdown('country', country, description="Country"),
      web.form.Textbox('runtime',check_integer, description="Runtime"),
      web.form.Dropdown('director_id', director, description="Director"),
      web.form.Dropdown('actor', actors, description="Actors"),
      web.form.Dropdown('writer', writers, description="Writers"),
      web.form.Dropdown('productor', productors, description="Productors"),
      web.form.Textarea('synopsis', rows="5", cols="20", description="Synopsis"),
      web.form.Textbox('video',web.form.Validator('Please youtube video link', check_video), description="Video Link"),
##      web.form.File('img', description="Image"),
      validators=[web.form.Validator('The movie exists', check_director_movies)]
      
      )
    
    def form_manual(self, form, validate):
       inp = web.input(genre=[])
       genres = inp.get("genre")
       form_html = form.render()
       form_html = form_html[0:-8]
       form_html += u'<tr><th><label for="genre">Genre</label></th><td>'
       for (genre_id,name) in self.genres:
          if str(genre_id) in genres:
             form_html += u'<input type="checkbox" value=%d name="genre" checked=true>%s' % (genre_id,name)  
          else:
             form_html += u'<input type="checkbox" value=%d name="genre">%s' % (genre_id,name)  
       if genres == [] and validate:
           form_html += u"<br><strong class='wrong'>Select anything</strong>"       
       form_html += u'</td></tr>'
       form_html += u'</table>'
       return form_html
        
    def GET(self):
       form = self.movie_add_form()
       form_html = self.form_manual(form, validate=False)       
       return render.add_movie(form_html)  

    def POST(self): 
                                         
        form = self.movie_add_form()
        inp = web.input(genre=[])
        genre = inp.get("genre")
        if not form.validates():
            form.title.value=clean_str(form.d.title)
            form.video.value=clean_video(form.d.video)
            form_html = self.form_manual(form, validate=True)        
            return render.add_movie(form_html)            
        else:   
            form.title.value=clean_str(form.d.title)
            form.video.value=clean_video(form.d.video)
##            x = web.input(img={})
##            filedir = "static/img"
##            if x.img.filename != "":
##               filepath=x.img.filename.replace('\\','/')
##               filename=filepath.split('/')[-1]
##               fout = open(filedir +'/'+ filename,'wb')
##               fout.write(x.img.file.read())
##               fout.close()
##               form.value.img = "/static/img/"+filename 
            new_movie_id = db.insert('movies', title=form.d.title, synopsis=form.d.synopsis,
                                     director_id=form.d.director_id, release_date=form.d.release_date,
                                     runtime=form.d.runtime, year=form.d.year, video=form.d.video)
           
            inp = web.input(genre=[])
            genre = inp.get("genre")
            for genre_id in genre:
               db.insert('movie_genre', movie_id=new_movie_id, genre_id=genre_id)

              
            act = web.input(actor=[])
            actor = act.get("actor")
            for actor_id in actor:
               db.insert('movie_actor', movie_id=new_movie_id, actor_id=actor_id)

            wri = web.input(writer=[])
            writer = wri.get("writer")
            for writer_id in writer:
               db.insert('movie_writer', movie_id=new_movie_id, writer_id=writer_id)

            con = web.input(country=[])
            country = con.get("country")
            for country_id in country:
               db.insert('movie_country', movie_id=new_movie_id, country_id=country_id)


            pro = web.input(productor=[])
            productor = pro.get("productor")
            for productor_id in productor:
               db.insert('movie_productor', movie_id=new_movie_id, productor_id=productor_id)

              
          
            
            raise web.seeother('/movie/%s/%d' % (form.d.title.replace(" ", "_"), new_movie_id))
        


  
"""NEW MOVIES"""
     
class newMovies:
    def GET(self):
        movies = db.query("SELECT * FROM movies order by movies.release_date DESC ")
        return render.newMovies(movies, "New Movies")

"""DIRECTOR"""

class director:
    def GET(self, director_name, director_id):
       director_id = int(director_id)
       director = db.select("director", where="director_id=$director_id", vars=locals())[0]
       
       """country"""
       country_id = director.country_id
       country =db.select("countries", where="country_id=$country_id", vars=locals())[0]

       director_movies =db.query("SELECT m.title, m.img, m.movie_id FROM movies AS m, director AS d \
                                  WHERE d.name=$director.name and m.director_id=d.director_id", vars=locals())       
       from urllib import quote_plus
       return render.director(director, quote_plus, country, director_movies)

class directors:
    def GET(self):
        directors = list(db.select("director"))
        inp=web.input()
        director_movies=[]
        director=inp.get("director", None)
        if director != None:
            director_name=director.replace("+"," ")
            director_movies = db.query("SELECT * from director, movie_director, movies \
                                    where director.director_id=movie_director.director_id and \
                                    movie_director.director_id=movies.movie_id and  \
                                    name=$director_name", vars=locals())
        return render.directors(directors, director_movies)

class add_director:
    country_rows = list(db.select("countries", order="country"))
    country = [ (row.country_id, row.country) for row in country_rows]

    def check_director(director):
       name=director.name
       director_rows = list(db.select("director"))
       director_names = [ d.name for d in director_rows]
       name = clean_str(name)
       return not name in director_names

    login = web.form.Form( 
          web.form.Textbox('name', web.form.Validator('Enter a director',required), description="Director Name"),
          web.form.Textbox('birthdate', web.form.Validator('Enter birthdate',required),
                           web.form.Validator('Incorrect data format, should be YYYY-MM-DD',date_time), description="Birthdate"),
          web.form.Dropdown('country_id', country, description="Country"),
          web.form.Textarea('biography', web.form.Validator('Enter biography',required), description="Biography"),
          web.form.Textbox('video',web.form.Validator('Please youtube video link', check_video),description="Video"),
          web.form.File('img', description="Image"),
          validators=[web.form.Validator('The director exists!',check_director)],
        
    )
    
           
    def GET(self):
        form = self.login()
        return render.add_director(form.render())

    def POST(self):         
        form = self.login() 
        if not form.validates():
            form.name.value = clean_str(form.name.value)
            return render.add_director(form.render())
        else:
            form.video.value=clean_video(form.d.video)
            form.name.value=clean_str(form.name.value)
            
            x = web.input(img={})
            filedir = "static/img"
            if x.img.filename != "":
               filepath=x.img.filename.replace('\\','/')
               filename=filepath.split('/')[-1]
               fout = open(filedir +'/'+ filename,'wb')
               fout.write(x.img.file.read())
               fout.close()
               form.value.img = "/static/img/"+filename 
            new_director=db.insert('director', name=form.d.name, birthdate=form.d.birthdate,
                                   country_id=form.d.country_id, biography=form.d.biography,
                                   video=form.d.video,img=form.value.img)
            raise web.seeother('/director/%s/%d'% (form.d.name.replace(" ","_"), new_director))    





"""WRITER"""

class writers:
    def GET(self):
        writers =list(db.select("writers", order="name"))
        inp = web.input()
        writer_movies=[]
        writer= inp.get("writer", None)
        if writer != None:
            writer_name= writer.replace("+", " ")
            writer_movies= db.query("SELECT * FROM movies AS m , writers AS w,\
                                    movie_writer AS mw WHERE m.movie_id =mw.movie_id \
                                    and w.writer_id=mw.writer_id and w.name=$writer_name", vars=locals())
        return render.writers(writers, writer_movies)


class add_writer:

    def check_writer(name):
       writer = db.select("writers")
       writer = [ w.name for w in writer]
       name = clean_str(name)
       return not name in writer

    login = web.form.Form( 
          web.form.Textbox('name',  
             web.form.Validator('Enter a writer', required),
             web.form.Validator('Writer exists!', check_writer),
             size=15,
             description="Writer Name"),           
    )
    
           
    def GET(self):   
        return render.add_writer(self.login.render())

    def POST(self):         
        form = self.login() 
        if not form.validates():
            form.name.value = clean_str(form.name.value)
            return render.add_writer(form.render())
        else:    
            new_writer = web.input().get("name")
            new_writer =clean_str(form.name.value)
            db.insert('writers', name=new_writer)                        
        return render.add_writer(self.login.render())
 



"""ACTOR"""
   
class add_actor:

    def check_actor(name):
       actor = db.select("actors")
       actor = [ a.name for a in actor]
       name = clean_str(name)
       return not name in actor

    login = web.form.Form( 
          web.form.Textbox('name',  
             web.form.Validator('Enter an actor', required),
             web.form.Validator('Actor exists!', check_actor),
             size=15,
             description="Actor Name"),           
    )
    
           
    def GET(self):   
        return render.add_actor(self.login.render())

    def POST(self):         
        form = self.login() 
        if not form.validates():
            form.name.value = clean_str(form.name.value)
            return render.add_actor(form.render())
        else:    
            new_actor = web.input().get("name")
            new_actor =clean_str(form.name.value)
            db.insert('actors', name=new_actor)                        
        return render.add_actor(self.login.render())


"""PRODUCTOR"""

class add_productor:

    def check_productor(name):
       productor = db.select("productors")
       productor = [ p.name for p in productor]
       name = clean_str(name)
       return not name in productor

    login = web.form.Form( 
          web.form.Textbox('name',  
             web.form.Validator('Enter a productor', required),
             web.form.Validator('Productor exists!', check_productor),
             size=15,
             description="Productor Name"),           
    )
    
           
    def GET(self):   
        return render.add_productor(self.login.render())

    def POST(self):         
        form = self.login() 
        if not form.validates():
            form.name.value = clean_str(form.name.value)
            return render.add_productor(form.render())
        else:    
            new_productor = web.input().get("name")
            new_productor =clean_str(form.name.value)
            db.insert('productors', name=new_productor)                        
        return render.add_productor(self.login.render())

"""COUNTRY"""    
class add_country:

    def check_country(name):
       country= db.select("countries")
       country = [ c.country for c in country]
       name = clean_str(name)
       return not name in country

    login = web.form.Form( 
          web.form.Textbox('name',  
             web.form.Validator('Enter a country', required),
             web.form.Validator('Country exists!', check_country),
             size=15,
             description="Country"),           
    )
    
           
    def GET(self):   
        return render.add_country(self.login.render())

    def POST(self):         
        form = self.login() 
        if not form.validates():
            form.name.value = clean_str(form.name.value)
            return render.add_country(form.render())
        else:    
            new_country = web.input().get("name")
            new_country =clean_str(form.name.value)
            db.insert('countries', country=new_country)                        
        return render.add_country(self.login.render())

"""COMING SOON"""
    
class comingSoon:
    def GET(self):
        movies = db.select("movies")
        return render.comingSoon(movies, "Coming Soon")


"""ABOUT"""
    
class about:
    def GET(self):
       return render.about()


       

if __name__ == "__main__":
    app = web.application(urls, globals())
    web.httpserver.runsimple(app.wsgifunc(), ("127.0.0.1", 1234))
       
       
