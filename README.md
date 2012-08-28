Namespace-in-CoffeeScript
=========================

Elegant pattern to simulate namespace in Coffeescript

How to use in the browser :

```coffeescript
namespace Foo:
  class Bar extends Baz
    #[...]
```

How to use in CommonJS environment :

```coffeescript
{namespace} = require './path/to/this/file'

namespace exports, Foo:
  class Bar extends Baz
    #[...]
```

We need this workaround because we must expose the targeted "exports" to this module