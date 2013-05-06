Damselfly
========

Damselfly is a Rails engine to add polymorphic file attachments leveraging [dragonfly][dragonfly] and counting references to avoid duplicates.

Installation
-----------

Your rails application should be using [Dragonfly][dragonfly]. If it's not, then follow its instructions to install and configure it, then come back here.
Add Damselfly to your Gemfile:

```ruby
gem 'damselfly'
```

Usage
-----

Grab one of your models and include the Damselfly module, then declare any attachments you need:

```ruby
class Person < ActiveRecord::Base
  include Damselfly
  has_one_attached :avatar
  has_many_attached :photos
end
```

Internally, Damselfly treats singular attachments like a has_one association, and plural ones as a has_many.
Just assign the _data_ attribute to your attachment_attributes, like so:

```ruby
@john = Person.create!(name: "John", avatar_attributes: {data: Rails.root.join('sample.jpg')}, photos_attributes: [{data: Rails.root.join('another_sample.jpg')}])
```

That's all. You can now access @john.avatar or @john.photos as you would do with a model that uses [dragonfly][dragonfly].

License
-------

This project rocks and uses MIT-LICENSE.

[dragonfly]: https://github.com/markevans/dragonfly