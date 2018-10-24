# Coding Challenge
### Surveyor CLI Application

A CLI application to parse and display survey data from CSV files.

Below you will find some information on how to setup and perform common tasks.

## Installation

You can download this repository and install from source.

```
git clone https://github.com/ChrisMcDonaldJ/surveyor-cli.git
cd surveyor-cli
bundle install
```

## Available Scripts

In the project directory, you can run:

### `bundle exec rubocop`

You can verify that the code matches the Ruby Style Guide and what's configured in `.rubocop.yml` by running [RuboCop](https://rubocop.readthedocs.io/en/latest/).

### `bundle exec rspec`

You can run the tests and see what is failing by running [RSpec](http://rspec.info/documentation/).

## CLI Usage
```
Usage: ruby bin/survey-tool

  Options:
    -s, --survey FILE                   Survey data input file
    -r, --responses FILE                Responses data input file
    -h, --help                          Show this message
```