# Movie Watchlist

A movie watchlist app where you can create various lists for movies you have seen or plan to see. 

![Screen Shot 2022-03-14 at 6 20 00 PM](https://user-images.githubusercontent.com/94948064/158142422-769b3a76-0b3b-4744-8a89-97a78c7d6ffb.png) ![Screen Shot 2022-03-14 at 6 20 13 PM](https://user-images.githubusercontent.com/94948064/158142446-bbca7e8e-3ece-4394-bc14-e8fec8640a3d.png)

<br>
App home: https://nicole-movie-watchlist.herokuapp.com/
   
## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. 
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
