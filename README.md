# SmartCore::ValueObject &middot; [![Gem Version](https://badge.fury.io/rb/smart_value-object.svg)](https://badge.fury.io/rb/smart_value-object) [![Build Status](https://travis-ci.org/smart-rb/smart_value-object.svg?branch=master)](https://travis-ci.org/smart-rb/smart_value-object)

Value Object pattern realized in scope of Ruby.

---

## Major featurs

- `attribute` and `property` semantics;
- primitive immutability based on `#freeze` invocation;
- read-only instance attributes and properties;
- support for hash representation (other formats coming soon);
- support for comparability (`Comparable`, `#<=>`) and enumerability (`Enumerable`, `#each`);

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
  attribute :country, 'string'
  attribute :city,    'string'
  property :location, 'string'
  property :capital,  'boolean'
end

khabarovsk = Address.new('Russia', 'Khabaovsk', location: '48.4814/135.0721', capital: false)
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
