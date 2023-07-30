# House Quest API

## Introduction

This is a simple Sinatra API backend that uses Active Record to access and persist data in a database, which will be used by a separate [React frontend](http://localhost:9292) that interacts with the database via the API.

Here's a link to the [React Frontend Github Repo](https://github.com/dexterbrian/house-quest).

## Requirements

For this project, you must:

- Ruby

## Getting Started

### Backend Setup

[**Fork and clone**][fork link] this repository to get started. Then, run
`bundle install` to install the gems.

[fork link]: https://github.com/dexterbrian/house-quest-api/fork

You can start your server with:

```console
$ bundle exec rake server
```

This will run your server on port
[http://localhost:9292](http://localhost:9292).

### Frontend Setup

[**Fork and clone**][fork link] this repository to get started. Then, run
`npm install` to install the gems.

[fork link]: https://github.com/dexterbrian/house-quest/fork

You can start the React App with:

```console
$ npm run dev
```