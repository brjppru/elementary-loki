#!/bin/sh

### Change style indicator keyboard
sudo mcedit /usr/share/themes/elementary/gtk-3.0/apps.css +308

exit

### Replace CODE
.composited-indicator .keyboard {
    background-color: transparent;
    border-radius: 2px;
    box-shadow: none;
    color: #fff;
    font-weight: 600;
    padding: 0 3px;
    text-shadow: none;
}
