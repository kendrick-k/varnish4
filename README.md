Varnish 4 VCL with Ansible
==========================

# Varnish 4

## Varnish Processing States

Varnish [processing diagram](https://www.varnish-cache.org/docs/trunk/reference/states.html)

# Deploying

You can deploy your VCL into a directory with Ansible through Git into the varnish directory

    /etc/varnish
    
and make a symlink to the varnish.vcl of this project (with the imports so, remove the default.vcl before) :

    ln -s varnish4/varnish.vcl default.vcl
    
ls -la would show you :
    
    default.vcl -> varnish4/varnish.vcl
    
full path would be :

    /etc/varnish/default.vcl -> /etc/varnish/varnish4/varnish.vcl
    
In that way you would never have to overwrite the default.vcl and you could use the flexibility of Ansible to update your VCL and reload the Varnish configuration (and rollback if necessary).
