## Beginner RoR

Simple project for fertilization management project: https://fertilization-mp.herokuapp.com/

| Login  | Dashboard |
| ------------- | ------------- |
| ![img](https://i.ibb.co/hWWyCD4/Screenshot-1.png)  | ![img](https://i.ibb.co/VC1pMRz/Screenshot-2.png) |



## Deploy

> git push heroku master

* then got error `Precompiling assets failed.`

* checking assets/stylesheets/css wrong code / comment / the delete wrong code

> bundle exec rails assets:precompile RAILS_ENV=production

* then commit and push

> git push heroku master

* compile to heroku was successfully

> heroku run rails db:migrate

> heroku open

gotcha ---> https://fertilization-mp.herokuapp.com/



## Default DB

> heroku run rails console

* config default table value

> role = Role.new
> role.role_name = "ADMIN"
> role.save

> role = Role.new
> role.role_name = "ASSISTANT"
> role.save

> role = Role.new
> role.role_name = "GUEST"
> role.save

* Change role first user registered to ADMIN role

> u = User.find(1)
> u.update_column :role_id, 1
