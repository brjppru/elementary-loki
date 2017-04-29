
#       ssh-add $HOME/.ssh/${^identities}
        ls -1 /home/laptop/.ssh/*.pvk | xargs ssh-add
