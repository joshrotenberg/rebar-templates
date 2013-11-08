## rebar-templates

I found myself creating a few projects with
[poolboy](https://github.com/devinus/poolboy) and figured I'd create a
rebar template to make it easier.

### Dependencies

[Erlang](http://erlang.org) and [rebar](https://github.com/rebar/rebar).

### Installation

The easiest way to use these is to put them in your ~/.rebar/templates directory:

```
# if it isn't already there ...
mkdir ~/.rebar/templates
cd ~/.rebar/templates
git clone git@github.com:joshrotenberg/rebar-templates.git
cd # to wherever you want to create an app
mkdir doof && cd doof
rebar create template=poolboy appid=doof
make
erl -pa ebin/ deps/*/ebin
```

then ...

```
application:start(doof).
```

