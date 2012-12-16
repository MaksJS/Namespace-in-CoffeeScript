###
# Testing the namespace module width Mocha and Chai
#
# You need Mocha to be installed globally with npm install -g mocha
# Then type mocha --compilers coffee:coffee-script -R spec --colors into the main directory
###

# Chai assertion librairy
do (chai = require 'chai').should
# Namespace module
require '../src/namespace'

# Fix : module is already defined by CommonJS's module so we need to explicity bind module to the global reference
# Module notation is only really used in browser environnement
module = global.module

# Fixtures
namespace Package1:
  class Foo

module Package2:
  class Foo

namespace Package3:SubPackage1:
  class Foo

module Package4:SubPackage1:
  class Foo

module Package5:SubPackage1:SubPackage2:
  class Foo

namespace global:
  class Bar

instance1 = new Package1.Foo
instance2 = new Package2.Foo
instance3 = new Package3.SubPackage1.Foo
instance4 = new Package4.SubPackage1.Foo
instance5 = new Bar

# Testing
describe 'Namespace module testing', ->

  it "should return that namespace function is globally defined", ->
    namespace.should.exist

  it "should return that module function is globally defined", ->
    module.should.exist

  it "Package1.Foo should be a Class", ->
    Package1.Foo.should.be.a('function')

  it "Package2.Foo should be a Class", ->
    Package2.Foo.should.be.a('function')

  it "Package3.SubPackage1.Foo should be a Class", ->
    Package3.SubPackage1.Foo.should.be.a('function')

  it "Package4.SubPackage1.Foo should be a Class", ->
    Package4.SubPackage1.Foo.should.be.a('function')

  it "Package5.SubPackage1.SubPackage2.Foo should be a Class", ->
    Package5.SubPackage1.SubPackage2.Foo.should.be.a('function')

  it "global.Bar should be a Class", ->
    Bar.should.be.a('function')

  it "instance1 should be a valid object", ->
    instance1.should.be.an('object')

  it "instance2 should be a valid object", ->
    instance2.should.be.an('object')

  it "instance3 should be a valid object", ->
    instance3.should.be.an('object')

  it "instance4 should be a valid object", ->
    instance4.should.be.an('object')

  it "instance5 should be a valid object", ->
    instance5.should.be.an('object')