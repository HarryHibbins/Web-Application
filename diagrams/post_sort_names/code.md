
alias client ="Client"
alias rackup = "Rackup/server"
alias app ="Application class"
alias post_block ="post /sort_names block"

client->rackup:"post/sort_names?names=Joe,Alice,Zoe,Julia,Kieran"
rackup->app: "forwards request"
app->post_block: "calls post/sort_names with unordered names"
post_block->app: "returns Alice,Joe,Julia,Kieran,Zoe (ordered)"
app->rackup: "response status: 200. body: Alice,Joe,Julia,Kieran,Zoe "
rackup->client: "Alice,Joe,Julia,Kieran,Zoe"


