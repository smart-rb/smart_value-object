# SmartCore::ValueObject &middot; <a target="_blank" href="https://github.com/Cado-Labs"><img src="https://github.com/Cado-Labs/cado-labs-logos/raw/main/cado_labs_badge.svg" alt="Supported by Cado Labs" style="max-width: 100%; height: 20px"></a> &middot; [![Gem Version](https://badge.fury.io/rb/smart_value-object.svg)](https://badge.fury.io/rb/smart_value-object)

Value Object pattern realized in scope of Ruby.

---

<p>
  <a href="https://github.com/Cado-Labs">
    <img src="https://github.com/Cado-Labs/cado-labs-logos/blob/main/cado_labs_supporting.svg" alt="Supported by Cado Labs" />
  </a>
</p>

---

## Major featurs

- `attribute` and `property` semantics;
- primitive immutability based on `#freeze` invocation;
- read-only instance attributes and properties;
- support for hash representation (other formats coming soon);
- support for:
  - semantic comparability (`Comparable`, `#<=>`, `#eql?`) (based on object's type and object's attributes and parameters);
  - semantic enumerability (`Enumerable`, `#each`) (enumerates itself by default);
  - (`soon`) `#clone` and `#dup`;

---

## Installation

```ruby
gem 'smart_value-object'
```

```shell
bundle install
# --- or ---
gem install smart_value-object
```

```ruby
require 'smart_core/value-object'
```

---

## Synopsis

```ruby
class Address < SmartCore::ValueObject
  attribute :country, 'value.string' # an alias of SmartCore::Types::Value::String (see smart_initializer gem)
  attribute :city,    'value.string'
  property :location, 'value.string'
  property :capital,  SmartCore::Types::Value::Boolean
end

khabarovsk = Address.new('Russia', 'Khabaovsk', location: '48.4814/135.0721', capital: false)
same_city = Address.new('Russia', 'Khabaovsk', location: '48.4814/135.0721', capital: false)
another_city = Address.new('Russia', 'Moscow', location: '59.9311/30.3609', capital: false)
```

```ruby
khabarovsk.frozen? # => true
```

```ruby
khabarovsk.country # => 'Russia'
khabarovsk.city # => 'Khabarovsk'
khabarovsk.location # => '48.4814/135.0721'
khabarovsk.capital # => false
```

```ruby
khabarovsk.to_h # or #as_hash or #to_hash
# => returns:
{ city: 'Russia', country: 'Khabaovsk', location: '48.4814/135.0721', capital: false }
```

```ruby
# comparability:
khabarovsk == same_city # => true
khabarovsk == another_city # => false
```

```ruby
# default Enumerable behavior:
khabarovsk.to_a # => [khabarovsk]
khabarovsk.each { |entity| puts entity } # => outputs itself
```

---

## Roadmap

- Migrate to `GitHub Actions`;

---

## Build

- run tests:

```shell
bundle exec rspec
```

- run code style checks:

```shell
bundle exec rubocop
```

- run code style checks with auto-correction:

```shell
bundle exec rubocop -A
```


---

## Contributing

- Fork it ( https://github.com/smart-rb/smart_value-object )
- Create your feature branch (`git checkout -b feature/my-new-feature`)
- Commit your changes (`git commit -am '[feature_context] Add some feature'`)
- Push to the branch (`git push origin feature/my-new-feature`)
- Create new Pull Request

## License

Released under MIT License.

## Supporting

<a href="https://github.com/Cado-Labs">
  <img src="https://github.com/Cado-Labs/cado-labs-logos/blob/main/cado_labs_logo.png" alt="Supported by Cado Labs" />
</a>

## Authors

[Rustam Ibragimov](https://github.com/0exp)
