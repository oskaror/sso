# SSO
### Prerequisites

* Ruby ver. 2.7
* Elixir
* PostgreSQL


### Installation

1. Clone the repo
   ```sh
   git clone <REPO_URL>
   ```
2. Setup the store application
   ```sh
   ./store/bin/setup
   ```
3. Setup the analytics application
   ```sh
   (cd analytics && mix deps.get)  
   ```
2. Install foreman 
   ```sh
   gem install foreman
   ```
   
## Usage

To start the project run 
```sh 
 foreman start
```

The store application will be available on `lvh.me:3000` and the analytics application will be available on `analytics.lvh.me:4000`

In development there will be two sample accounts for testing:

User account:
```sh
  email: user@example.com
  password: password
```

Admin account:
```sh
  email: admin@example.com
  password: password
```

## Tests
* **Store** - Use the `rspec` and `rubocop` commands to run the application tests
* **Analytics** - Use the `mix test` command 
