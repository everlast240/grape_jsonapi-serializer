# Grape::JsonapiSerializer

Use [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer), instead of [fast_jsonapi](https://github.com/Netflix/fast_jsonapi) with [Grape](https://github.com/ruby-grape/grape).

## Introduction

The Netflix's fast_jsonapi gem (https://github.com/Netflix/fast_jsonapi) is unsupported since some time.
First a community fork as created here: https://github.com/fast-jsonapi/fast_jsonapi, but it was then renamed to
[jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)

This humble gem updates [grape_fast_jsonapi](https://github.com/EmCousin/grape_fast_jsonapi) to use the new *jsonapi-serializer* fork.

## TODO

Some spec fixes & improvements are needed

## Installation

Add the `grape` and `grape_jsonapi-serializer` gems to Gemfile.

```ruby
gem 'grape'
gem 'grape_fast_jsonapi', git: 'https://github.com/everlast240/grape_jsonapi-serializer'
```

## Usage

### Tell your API to use Grape::Formatter::JsonapiSerializer

```ruby
class API < Grape::API
  content_type :jsonapi, "application/vnd.api+json"
  formatter :json, Grape::Formatter::JsonapiSerializer
  formatter :jsonapi, Grape::Formatter::JsonapiSerializer
end
```

### Use `render` to specify JSONAPI options

```ruby
get "/" do
  user = User.find("123")
  render user, include: [:account]
end
```

### Use a custom serializer

```ruby
get "/" do
  user = User.find("123")
  render user, serializer: 'CustomUserSerializer'
end
```

Or

```ruby
get "/" do
  user = User.find("123")
  render CustomUserSerializer.new(user).serialized_json
end
```

### Model parser for response documentation

When using Grape with Swagger via [grape-swagger](https://github.com/ruby-grape/grape-swagger), you can generate response documentation automatically via the provided following model parser:

```ruby
# JsonapiSerializer example

# app/serializers/application_serializer:
class ApplicationSerializer
  include JSONAPI::Serializer

  set_key_transform :dash
end

# app/serializers/user_serializer.rb
class UserSerializer < ApplicationSerializer
  belongs_to :group

  attributes :name, :email
end

# config/initializers/grape_swagger.rb
GrapeSwagger.model_parsers.register(GrapeSwagger::JsonapiSerializer::Parser, ApplicationSerializer)

# Your grape API endpoint
desc 'Get current user' do
  success code: 200, model: UserSerializer, message: 'The current user'
# [...]
end
```

Note that you **need** the `grape-swagger` gem for this to work, otherwise it will throw an error.

## Credit

Code adapted from [grape_fast_jsonapi](https://github.com/EmCousin/grape_fast_jsonapi)
