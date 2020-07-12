# SmartCore::ValueObject &middot; [![Gem Version](https://badge.fury.io/rb/smart_value-object.svg)](https://badge.fury.io/rb/smart_value-object) [![Build Status](https://travis-ci.org/smart-rb/smart_value-object.svg?branch=master)](https://travis-ci.org/smart-rb/smart_value-object)

---

## Major featurs

- `attribute` and `property` semantics;
- primitive immutability based on `#freeze` invocation on value object instance;
- read-only instance attributes and properties;

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
end
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
