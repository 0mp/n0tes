``` ruby            
______      _                          ______      _ _     
| ___ \    | |                         | ___ \    (_) |    
| |_/ /   _| |__  _   _    ___  _ __   | |_/ /__ _ _| |___
|    / | | | '_ \| | | |  / _ \| '_ \  |    // _` | | / __|
| |\ \ |_| | |_) | |_| | | (_) | | | | | |\ \ (_| | | \__ \
\_| \_\__,_|_.__/ \__, |  \___/|_| |_| \_| \_\__,_|_|_|___/
                   __/ |                                   
                  |___/                                    
```

# Getting started:

- new app:
    ``` bash
    rails new NewApp
    bundle install
    rails server
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

---
---
---
#### handy tools:
- [Markdown suppport](https://support.codebasehq.com/articles/tips-tricks/syntax-highlighting-in-markdown).
