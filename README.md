RailsPress
==========

Simple blog application with Rails, heroku and Amazon S3.

See [DEMO](http://rails-press.herokuapp.com/)

- Ruby 2.0
- Ruby on Rails 4.0.1
- heroku
- Amazon S3


## Features

RailsPress is much simpler than wordpress but good enough for blogging.

- Users
- Categories
- Tags
- Ajax image uploader
- Markdown writing
- Turbolinks
- Sitemap generator
- Basic SEO
- Responsive design with bootstrap
   


## Getting Started

#### Deploying with Git

You need to know how to deploy to [heroku](http://heroku.com) with Git.
See [Deploying with Git](https://devcenter.heroku.com/articles/git)
   
#### Amazon S3 account 

** Access key / Secret Access Key **
- Create AWS account. [http://aws.amazon.com/](http://aws.amazon.com/)
- Go to Security Credential and create Access key/Secret Access Key.

** S3 Bucket Policies **
- Add a bucket in S3.
- See 'Properties' of the bucket.
- Click 'Permissions' > 'Edit bucket policy.
- Click [Sample Bucket Policies](http://docs.aws.amazon.com/AmazonS3/latest/dev/AccessPolicyLanguage_UseCases_s3_a.html).
- Copy the code for 'Granting Permission to an Anonymous User'.
- Paste it into 'Bucket Policy Editor' and edit your backet name like below.
```
"Resource": "arn:aws:s3:::YOUR_BUCKET_NAME/*"
```
- Save.

** S3 Static Website Hosting **
- See 'Properties of the bucket'.
- Click 'Static Website Hosting'.
- Select 'Enable website hosting' and type like below.
```
Index Document: index.html
Error Document: error.html
```
- Save.
    
#### Initialization
Add environment variables on heroku.
```
#################
### SECRET TOKEN
### You can create secret token by 'rake secret' command.
#################

heroku config:set RP_SECRET_TOKEN=""

#################
### DATABASE
#################

heroku config:set RP_DB_PRODUCTION=""
heroku config:set RP_DB_PRODUCTION_USERNAME=""
heroku config:set RP_DB_PRODUCTION_PASSWORD=""

#################
### SITE INFO
#################

heroku config:set RP_SITENAME="YOUR-BLOG-NAME"
heroku config:set RP_SITEURL="http://YOUR-BLOG-URL"
heroku config:set RP_META_DESC=""
heroku config:set RP_GOOGLE_PLUS_ID=""
heroku config:set RP_FACEBOOK_ADMIN_ID=""
heroku config:set RP_GOOGLE_ANALYTICS_ID=""
heroku config:set RP_GOOGLE_ADSENSE_ID="ca-pub-5366654401495221"

#################
### AMAZON S3
#################

heroku config:set RP_AWS_ENDPOINT=""
heroku config:set RP_AWS_KEY=""
heroku config:set RP_AWS_SECRET="f"
heroku config:set RP_AWS_REGION=""
heroku config:set RP_AWS_BUCKET=""

#################
### E-MAIL
#################

heroku config:set RP_HOSTNAME=""
heroku config:set RP_EMAIL_ADDRESS=""
heroku config:set RP_EMAIL_PASSWORD=""

#################
### IMAGE
#################
heroku config:set RP_IMAGE_NAME="railspress"
```

#### heroku setup
You need at least Heroku Postgres Add-on.

** Add git remote **
```
git remote add heroku git@heroku.com:YOUR-APP.git
```

** Push RailsPress to heroku ** 
```
git push heroku master
```

** Run rake command ** 
```
heroku run rake db:migrate
```

#### Add user
Visit '/signup' and you can create a new user.
If you don't want other users, edit 'controllers/users_controller.rb/'
```
before_action :signed_in_user,	only: [:new, :create, :index, :show, :edit, :update, :destroy]
```

That's it. Althought it takes a bit longer than Wordpress, I'm so confortable to write a blog post with simple markdown format and satisfied with the quick page responce.




