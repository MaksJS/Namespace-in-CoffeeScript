Namespace-in-CoffeeScript
=========================

Elegant pattern to simulate namespace in Coffeescript

How to use in the browser :

```coffeescript
namespace Foo:
  class Bar extends Baz
    #[...]
```

```coffeescript
namespace Foo:SubPackage1:SubPackage2:
  class Bar extends Baz
    #[...]
```

or

```coffeescript
module Foo:
  class Bar extends Baz
    #[...]
```

```coffeescript
module Foo:SubPackage1:SubPackage2:
  class Bar extends Baz
    #[...]
```

then

```coffeescript
instance = new Foo.Bar
other    = new Foo.SubPackage1.SubPackage2.Bar
```

__Notice : Don't use the same name for your namespace and your class to avoid collisions.

How to use in CommonJS environment :

```coffeescript
require './path/to/this/file' # require once in your application
```

Then use you can use it as on the browser. 
__But you can't use the "module" notation because it's already reserved by the CommonJS environnement. Use "namespace" instead.__

You can specify that you want to use the global namespace. So your code will be exposed to the correct root : window or global for CommonJS environment.
So you don't need to write something like root = global ? window, root.myClass = myClass under your class.

```coffeescript
namespace global:
  class myClass
```
