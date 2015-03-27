vcl 4.0;

acl purge {
    "localhost";
}

backend default {
    .host = "host";
    .port = "80";
}

sub vcl_recv {

}

#sub vcl_pipe {
#    return (pipe);
#}

#sub vcl_pass {
#    return (pass);
#}

sub vcl_hash {
    return (lookup)
}

sub vcl_hit {

}

sub vcl_miss {

}

sub vcl_backend_fetch {

}

sub vcl_backend_response {

}

sub vcl_deliver {

}