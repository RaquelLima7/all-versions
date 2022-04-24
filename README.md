# Second Challenge

<br>

Ruby on Rails project using the PaperTrail gem where we can see the customer's versions. We can view and revert a version, as well as restore a deleted customer.

<p align="center">
  <a href="https://ruby-doc.org/core-3.0.1/">
    <img alt="Ruby Version" src="https://img.shields.io/badge/Ruby-3.0.1 -green.svg" target="_blank">
  </a>
  <a href="https://guides.rubyonrails.org/6_1_release_notes.html">
    <img alt="" src="https://img.shields.io/badge/Rails-~> 6.1.5-blue.svg" target="_blank">
  </a>
</p>

## Screenshot

- Index with all customers and show - creating a customer
![](https://github.com/RaquelLima7/second-challange/blob/master/app/assets/images/01_screenshot.gif)

<br>

- Editing a customer - deleting a customer
![](https://github.com/RaquelLima7/second-challange/blob/master/app/assets/images/02_screenshot.gif)

<br>

- View all customer versions - details page - revert version
![](https://github.com/RaquelLima7/second-challange/blob/master/app/assets/images/03_screenshot.gif)

<br>

- See all deleted customers - restore customer
![](https://github.com/RaquelLima7/second-challange/blob/master/app/assets/images/04_screenshot.gif)

<br>

## Stack the Project

- **Ruby on Rails**
- **Bootstrap**
- **Sqlite3**
- **Rspec**
- **Docker**

## Tests
![](https://github.com/RaquelLima7/second-challange/blob/master/app/assets/images/05_rspec.gif)
## Building application

First you must have:

1. Ruby >= 3.0.1 installed.

As soon as you have everything done you can follow

## Run Project

Clone the project

```bash
  git clone https://github.com/RaquelLima7/second-challange.git
```

Go to the project directory

```bash
  cd second-challange
```
<br>

### 1. Building everything

If you want to rock and create your dev environment and data, it's possible to go through the usual way:

1. And to *bundle* it with command:
```
bundle install
```

2. Create databases
```
rails db:create
```

3. Run migrations
```
rails db:migrate
```
4. If you prefer, you can populate the database with the command:

```
rails db:seed
```

5. Run tests

```
rspec
```
### 2. Building everything with docker

If you want to use Docker to create your development and data environment, you can follow the path below.

#### Necessary documentation:
- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [Docker Compose](https://docs.docker.com/compose/install/)

1. Building the project
```
docker-compose build
```

2. Start the application
```
docker-compose up
```

3. Create database
```
docker-compose run web rails db:create
```

4. Run migrations
```
docker-compose run web rails db:migrate
```

5. If you prefer, you can populate the database with the command:

```
docker-compose run web rails db:seed
```

6. Run tests

```
docker-compose run web rspec
```
