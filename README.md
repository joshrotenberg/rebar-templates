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

.. then ...

```
1> application:start(doof).
ok
2> poolboy:status(doof_pool).
{ready,10,0,0}
3> Worker = poolboy:checkout(doof_pool).
<0.40.0>
4> poolboy:status(doof_pool).
{ready,9,0,1}
5> poolboy:checkin(doof_pool, Worker).
ok
6> poolboy:status(doof_pool).
{ready,10,0,0}
7> ...
```

and then you write your app.

