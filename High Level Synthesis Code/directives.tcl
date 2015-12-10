#set_directive_unroll -factor 2 "dijkstra/loop1"
set_directive_loop_flatten "dijkstra/loop1"
set_directive_loop_flatten "dijkstra/loop3"
#set_directive_inline -region -recursive top
