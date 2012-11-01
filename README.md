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

then

```coffeescript
instance = new Foo.Bar
```

How to use in CommonJS environment :

```coffeescript
require './path/to/this/file' # require once in your application
```

Then use you can use it as on the browser. But you can't use the "module" notation because it's already reserved by the CommonJS environnement. Use "namespace" instead.

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