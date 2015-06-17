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
4> counter:
get_count/0    incr/0         incr/1         module_info/0  module_info/1  
start/0        stop/0         
4> counter:get_count().
0
5> counter:incr().     
ok
6> counter:incr().
ok
7> counter:incr().
ok
8> counter:get_count().
3
9> counter:incr(-100). 
ok
10> counter:get_count().
-97
11> q().
ok
12> $ 
```

