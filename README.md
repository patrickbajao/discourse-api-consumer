# discourse-api-consumer

This is a CLI tool that makes request to a Discourse API. This utilizes the `[discourse_api](https://github.com/discourse/discourse_api)` gem.

## Requirement

[RVM](https://rvm.io/) with Ruby 2.3.1 installed.

## Setup

1. Clone the repository.
2. Run `bundle install`.
3. Copy `discourse.env.sample` as `discourse.env` and set your desired `DISCOURSE_API` and `DISCOURSE_API_KEY` variables.

## How To Use

it's easy, just Run `bundle exec ruby client.rb`. It accepts the following options:

### Endpoint

This can be set by passing `-e` or `--endpoint` options. This is a required option. Example: `-e notifications` or `--endpoint notifications`.

### Parameters

This option will be passed to the endpoint specified. It can be a simple string or a JSON string. Example: `-p staff` or `--params '{"category_slug":"staff"}'`.

### Username

This can be set by passing `-u` or `--username` options. Example: `-u patrickbajao` or `--username patrickbajao`.

### Example

Getting notifications of a user:

`$ bundle exec ruby client.rb -e notifications -u patrickbajao`

Getting top topics in a category:

`$ bundle exec ruby client.rb -e category_top_topics -u patrickbajao -p '{"category_slug":"staff"}'`
