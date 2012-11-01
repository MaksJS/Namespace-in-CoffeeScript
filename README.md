Namespace-in-CoffeeScript
=========================

Elegant pattern to simulate namespace in Coffeescript

How to use in the browser :

```coffeescript
namespace Foo:
  class Bar extends Baz
    #[...]
```

or

```coffeescript
module Foo:
  class Bar extends Baz
    #[...]
```

How to use in CommonJS environment :

```coffeescript
require './path/to/this/file' # require once in your application
```

Then use it as on the browser :)

Note : if you use subpackages, you will need to quote the name of the namespace 

If you use dots :

```coffeescript
namespace 'Foo.bar.baz':
  class myClass
```

If you use slashes :

```coffeescript
namespace 'Foo\bar\baz':
  class myClass
```