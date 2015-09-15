# Enum For What!

This gem is an extension to ActiveRecord which enables native support of enumerations in the database schema using the ENUM type in MySQL.

Originally forked from [eletronick/enum_column][1] with several enhancements written and curated from the unenumerable forks of this
gem (see what I did there?) with love by [Sport Ngin][2] - including support from Rails 3.2 up to 4.2.

Supported adapters:
- mysql
- mysql2
- jdbcmysql (by Nilesh Trivedi)

## Installation

In your Gemfile:

```ruby
gem 'enum_for_what'
```

## Usage

In your schema(s), specify the constraint as a limit:

```ruby
create_table :enumerations, :force => true do |t|
  t.column :severity, :enum, :limit => [:low, :medium, :high, :critical], :default => :medium
  t.column :color, :enum, :limit => [:red, :blue, :green, :yellow]
end
```

In the model, you can then automatically validate this column using:

```ruby
validates_columns :severity, :color
```

The rest will be handled for you. All enumerated values will be given as symbols.

```ruby
@e = Enumeration.new
@e.severity = :medium
```

You can always use the column reflection to get the list of possible values from the database column.

```ruby
Enumeration.columns_hash['color'].limit
# or
@enumeration.column_for_attribute(:color).limit

# Will yield => [:red, :blue, :green, :yellow]
```

If you assign a string to the column, it will be converted to a symbol if it's valid and `nil` otherwise,
so if this is the only way you populate color, `validates_presence_of` may be the only validation you need.

```ruby
Enumeration.new(:color => "red") (color will be :red)
Enumeration.new(:color => "infrared") (color will be nil)
```

In views, you can use the enum_select helper to generate input for enumerated attributes:

```ruby
<%= enum_select(@enumeration, 'severity')%>
# or
<%= form_for @enumeration do |f| %>
  <%= f.label :severity %>
  <%= f.enum_select :severity %>
<% end %>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]: https://github.com/electronick/enum_column
[2]: http://www.codinginthecrease.com/
