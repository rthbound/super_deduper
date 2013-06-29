# SuperDeduper

It's a super deduper.

## Installation

**Note** you will need postgres up and running in your app. Add this line to your application's Gemfile:

    gem 'super_deduper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install super_deduper

## Usage

```ruby
SuperDeduper.new(enum: ["John Doe", "Jane Doe"], class: Person, column: "name")
```

will tell you if anything matches either

```ruby
  Person.where("name ilike %John%") # or
  Person.where("name ilike %Doe%")


  Person.where("name ilike %Jane%") # or
  Person.where("name ilike %Doe%")
```

and return to you either "No matches found" (successful), or a namespaced hash showing what was found for each element passed in with `:enum`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
