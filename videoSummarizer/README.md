### Install Dependencies:

* pip install -r requirements.txt



### Steps to run:

* Create a database named 'VideoSummarizer':

  ```
  mysql -u root -p
  create database VideoSummarizer
  ```

  

* In *videoSummarizer* folder, change the *mysql.cnf*  file according to your mysql details.

* In *settings.py* file in *videoSummarizer* folder, add path of the above *mysql.cnf* file in ``` read_default_file```  field.

* Add tables to your database using : 

   ``` python manage.py migrate```

* Run the server using:

   ``` python manage.py runserver```

* You can create a superuser using: 

  ```python manage.py createsuperuser```



### General:

* A user can upload videos only when he is logged in.
* Uploaded videos should not be larger than 100 MB in size.