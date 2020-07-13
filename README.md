# SmartCore::ValueObject &middot; [![Gem Version](https://badge.fury.io/rb/smart_value-object.svg)](https://badge.fury.io/rb/smart_value-object) [![Build Status](https://travis-ci.org/smart-rb/smart_value-object.svg?branch=master)](https://travis-ci.org/smart-rb/smart_value-object)

Value Object pattern realized in scope of Ruby.

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
  attribute :country, 'value.string' # an alias of SmartCore::Types::Value::String (check smart_initialzer gem)
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

## Contributing

- Fork it ( https://github.com/smart-rb/smart_value-object )
- Create your feature branch (`git checkout -b feature/my-new-feature`)
- Commit your changes (`git commit -am '[feature_context] Add some feature'`)
- Push to the branch (`git push origin feature/my-new-feature`)
- Create new Pull Request

## License

Released under MIT License.

## Authors

[Rustam Ibragimov](https://github.com/0exp)
