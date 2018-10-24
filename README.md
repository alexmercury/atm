# Grape ATM

**Implement an ATM in the form of a RESTful API:**
1) There should be a function of “filling” money in an ATM - the number of bills of each denomination is sent (for example, 10 bills for "50", 8 for "25", etc.). Ratings are: 1, 2, 5, 10, 25, 50.
2) Implement a method that accepts the amount to be issued and returns the desired values. If the ATM does not have enough money to issue - the user should receive a message about this. For example, if you received a request for the issuance of UAH 200, and there are 3 bills of 50 and 4 for 25 each, then the result could be: {50 => 3, 25 => 2} or {50 => 2, 25 => four}. The amount of money in stock should decrease after each issue.

## Installation

Execute:

    $ bundle install




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Создать api для авторизации(регистрация и логин),

gem 'devise'

gem 'devise_token_auth'
  
  
  
  
  добавить админку со списком пользовелей,
  
  gem 'activeadmin'
  
   которых можно редактировать 
   (дизайн простейший или на свое усмотрение)
   
   Добавить в апи метод для создания пользователем заметки, 
   которая будет сохранятся в текстовом виде, 
   со временем,
    когда пользователь хочет получить напоминание 
    об этой заметке. 
    
    Для напоминания реализовать функционал
    пуш-уведомлений, на iOS или Android на выбор.
    Ко всему вышеперечисленному реализовать документацию API.
    