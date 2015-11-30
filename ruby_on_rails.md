```             
______      _                          ______      _ _     
| ___ \    | |                         | ___ \    (_) |    
| |_/ /   _| |__  _   _    ___  _ __   | |_/ /__ _ _| |___
|    / | | | '_ \| | | |  / _ \| '_ \  |    // _` | | / __|
| |\ \ |_| | |_) | |_| | | (_) | | | | | |\ \ (_| | | \__ \
\_| \_\__,_|_.__/ \__, |  \___/|_| |_| \_| \_\__,_|_|_|___/
                   __/ |                                   
                  |___/                                    
```

# Installation

http://railsapps.github.io/installrubyonrails-mac.html

# Getting started:

- new app:
    ``` bash
    $ rails new NewApp
    $ bundle install
    $ rails server
    ```
- viewing local app:  
    `http://localhost:8000`


# Generating MVC:

- controller:  
    ``` bash
    $ rails generate controller Name
    ```

# Routing
- add request to map requests in `config/routes.rb` file:
    ``` ruby
    Rails.application.routes.draw do
      get 'tags' => 'tags#index'
    end
    ```



# Database:

- a foreign key: `t.references :tag`

## CRUD:
    ``` ruby
    # create
    t = Tweet.new
    t.status = "I love you."
    t.save

    # read
    Tweet.find(3)

    # update 
    t = Tweet.find(3)
    t.person = "Ann"
    t.save

    # delete
    t = Tweet.find(3)
    t.destroy
    ```

## Models:
    ``` ruby
    validates_presence_of :status
              numericality_of
              uniqueness_of
              confirmation_of
              acceptance_of
              length_of :password, minimum: 3
              format_of :email, with: /regex/i
              inclusion_of :age, in 21..99
              exclusion_of

    validates :status, presence: true, length: { minimum: 3 }
    ```

## Relationships:
    ``` ruby
    # in Zombie class definition
    has_many :tweets
    # in Tweet class definition
    class Tweet < ActiveRecord::Base
        belongs_to :zombie
    end
    ```

Weapon.where(:zombie_id => Zombie.where(:name => "Ashley"))

# Views

`app/views`

## ERB (Embedded Ruby)

- `<% ... %>` this is Ruby.
- `<%= ... %>` print the result of the Ruby funciton into HTML document.

- Usually, you would copypaste a lot of HTML headers and so on which
    is not very DRY. That is why ROR creates `application.html.erb` for use
    which has a default page template.   
    
    However we need to tell that file
    where we want to paste our Ruby code. So we put <%= yield %>
    
    - Creating links: `<%= link_to tweet.zombie.name, zombie_path(tweet.zombie) %>` OR <%= link_to tweet.zombie.name, tweet.zombie %>
      
      You can add a confirmation: `<%= link_to ... confirm: "Are you sure?" %>`

- List all tweets:
    ``` html
    <h1>Listing tweets</h1>
    <table>
    <% Tweet.all.each do |tweet| %>
        <tr>
            <td><%= link_to tweet.status, tweet%></td>
            <td><%= link_to tweet.zombie.name, tweet %></td>
        </tr>
    </table>
    ```
    What if there are no tweets?
    ``` html
    <h1>Listing tweets</h1>
    <table>
    <% tweets = Tweet.all %>
    <% tweets.each do |tweet| %>
        <tr>
            <td><%= link_to tweet.status, tweet%></td>
            <td><%= link_to tweet.zombie.name, tweet %></td>
        </tr>
    <% end %>
    <% if tweets.size == 0 %>
        <em>No Tweets Found</em>
    <% end %>
    </table>
    ```
- Edit & Destroy:
    ``` html
    ...
    <td><%= link_to "Edit", edit_tweet_path(tweet) %></td>
    <td><%= link_to "Destroy", tweet, method: :delete %></td>
    ```


- How to map?



    t.errors.messages

---

# Mess

1. The rails generate model command created a new model named Message. In doing so, Rails created two files:

a model file in app/models/message.rb. The model represents a table in the database.
a migration file in db/migrate/. Migrations are a way to update the database.
2. Open the migration file in db/migrate/. The migration file contains a few things:

The change method tells Rails what change to make to the database. Here it uses the create_table method to create a new table in the database for storing messages.
Inside create_table, we added t.text :content. This will create a text column called content in the messages tables.
The final line t.timestamps is a Rails command that creates two more columns in the messages table called created_at and updated_at. These columns are automatically set when a message is created and updated.
3. The rake db:migrate command updates the database with the new messages data model.

4. Finally the rake db:seed command seeds the database with sample data from db/seeds.rb.

---
```
<% @messages.each do |message| %>
<div class="message">
  <p class="content"><%= message.content %></p>
  <p class="time"><%= message.created_at %></p>
</div>
<% end %>
```


---

```
class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to '/messages'
    else
      render 'new'
    end
  end

  private
  	def message_params
      params.require(:message).permit(:content)
    end

end
```


<% @messages.each do |message| %> iterates through each message in @messages array. We created @messages in the Messages controller's index action.
For each message, we use <%= message.content %> and <%= message.created_at %> to display its content and the time when it was created.

---

```
<div class="header">
  <div class="container">
    <img src="http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/logo-1m.svg">
    <h1>Messenger</h1>
  </div>
</div>

<div class="messages">
  <div class="container">

		<% @messages.each do |message| %>
		<div class="message">
  <p class="content"><%= message.content %></p>
  <p class="time"><%= message.created_at %></p>
</div>
<% end %>
    <%= link_to 'New Message', "messages/new" %>

  </div>
</div>
```


---
---
---
#### handy tools:
- [Markdown suppport](https://support.codebasehq.com/articles/tips-tricks/syntax-highlighting-in-markdown).
