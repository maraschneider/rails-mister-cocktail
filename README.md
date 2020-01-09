# CocktailBook 

### Rails 

The default Rails template with webpack and postgres as database was used to bootstrap the project:

`rails new rails-mister-cocktail -T --webpack --database=postgresql`

### Database creation and initialization

```
rails db:create
rails db:migrate
rails db:seed # for sample data
```

### Running the project
You can install dependencies and run the project in development mode with:

```
cd my-app
npm install # or yarn
bundle install
rails server
```
Open up localhost:3000.

### Deployment

```
git push heroku master
heroku run rails db:migrate
heroku open

```
