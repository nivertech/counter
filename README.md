# counter
gen_server counter example

``` bash
$ cd counter
$ rebar clean compile
==> counter (clean)
==> counter (compile)
Compiled src/counter_sup.erl
Compiled src/counter_app.erl
Compiled src/counter.erl
Compiled src/counter_srv.erl
```

``` erlang
$ rebar shell
==> counter (shell)
Erlang/OTP 17 [erts-6.2] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]

Eshell V6.2  (abort with ^G)
1> application:which_applications().
[{crypto,"CRYPTO","3.4.1"},
 {stdlib,"ERTS  CXC 138 10","2.2"},
 {kernel,"ERTS  CXC 138 10","3.0.3"}]
2> counter:start().                 
ok
3> application:which_applications().
[{counter,"Counter server","1"},
 {crypto,"CRYPTO","3.4.1"},
 {stdlib,"ERTS  CXC 138 10","2.2"},
 {kernel,"ERTS  CXC 138 10","3.0.3"}]
4> {ok, C1} = counter:new(1000).
{ok,<0.48.0>}
5> counter:get_count(C1).
1000
6> counter:incr(C1, 555).
ok
7> counter:get_count(C1).
1555
8> {ok, C2} = counter:new(0).
{ok,<0.55.0>}
9> counter:get_count(C2).    
0
10> counter:incr(C2, -999).   
ok
11> counter:get_count(C2). 
-999
12> counter:stop(C1).
ok
13> counter:stop(C2).
ok
14> q().
ok
15> $
```
