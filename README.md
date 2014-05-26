Rails-mqpacker
==============

CSS post-processor which packs same media queries into one media query rule.

Usage
==============

### Ruby on Rails

Add `rails-mqpacker` to your `Gemfile`:

```ruby
gem 'rails-mqpacker', github: 'vast/rails-mqpacker'
```

Write your CSS (SASS, Stylus, Less) as usually:

```scss
#header {
  font-size: 2em;
  
  @media (max-width: 768px) {
    & {
      font-size: 1em
    }
  }
}

#footer {
  width: 80%;
  margin: 0 auto;
  
  @media (max-width: 768px) {
    & {
      width: auto;
    }
  }
}
```

Rails-mqpacker will pack similar media queries:

```css
@media (max-width: 768px) {
  #header {
    font-size: 1em;
  }
  
  #footer {
    width: auto;
  }
}
```

### Sprockets

If you use a non-Rails framework with Sprockets, connect Sprockets environment
with `RailsMqpacker`:


```ruby
assets = Sprockets::Environment.new do |env|
  # ...
end

require 'rails-mqpacker'
RailsMqpacker.install(assets)
```

