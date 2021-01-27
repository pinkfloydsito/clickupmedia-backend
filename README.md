## How to use with docker

1. Have `docker` and `docker-compose` installed (You can check this by doing `docker -v` and `docker-compose -v`)
2. Modify the following lines in the `database.yml` file:
  ``` yaml
  default: &default
    adapter: postgresql
    encoding: unicode
    pool: 5
    username: postgres
    password: postgres
    host: db
    port: 5432
  ```
3. Generate a secret key for the app by running `docker-compose run --rm --entrypoint="" web rake secret`, copy it and add it in your environment variables.
    1. Override the files application.yml (pasting the secretkey previously generated inside the APP_SECRET env variable) and database.yml
5. Run `docker-compose run --rm --entrypoint="" web rails db:create db:migrate`.
   . (Optional) If you want to deny access to the database from outside of the `docker-compose` network, remove the `ports` key in the `docker-compose.yml` from the `db` service.
7. Run the application with `docker-compose up`.
8. You can now try your REST services!
