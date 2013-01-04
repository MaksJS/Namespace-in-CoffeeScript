###
# Testing the namespace module width Mocha and Chai
#
# You need Mocha to be installed globally : npm install -g mocha
# Then run npm test
###

# Chai assertion librairy
do (chai = require 'chai').should
# Namespace module
require '../src/namespace'

# Module is already defined by CommonJS's module so here we need to explicity bind "module" notation to the global reference
module = global.module

describe 'Namespace module testing', ->

  it "should be globally defined", ->
    namespace.should.exist

  it "should be globally defined", ->
    module.should.exist

  it "should be the same reference", ->
    namespace.should.equal module

  namespace Package1:
    class Foo

  it "should be a class", ->
    Package1.Foo.should.be.a('function')

  namespace Package1:SubPackage1:
    class Foo

  it "should be a class", ->
    Package1.SubPackage1.Foo.should.be.a('function')

  namespace Package1:SubPackage1:SubPackage2:
    class Foo

  it "should be a class", ->
    Package1.SubPackage1.SubPackage2.Foo.should.be.a('function')

  namespace global:
    class Bar

  it "should be a global class", ->
    Bar.should.be.a('function')
    global.Bar.should.be.a('function')

  instance1 = new Package1.Foo

  it "should be a valid object", ->
    instance1.should.be.an('object')

  instance2 = new Package1.SubPackage1.Foo

  it "should be a valid object", ->
    instance2.should.be.an('object')