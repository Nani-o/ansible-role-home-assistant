[![Build Status](https://travis-ci.org/Nani-o/ansible-role-home-assistant.svg?branch=master)](https://travis-ci.org/Nani-o/ansible-role-home-assistant)

home-assistant
--------------

This role installs [Home Assistant](https://www.home-assistant.io), an home automation bridge.

Compatibility
-------------

- Ubuntu 14.04
- Ubuntu 16.04
- Ubuntu 18.04

Variables
---------

###### hass_user

The user under which homeassistant will be installed.

By default this var is set to `hass`.

```
hass_user: hass
```

###### hass_user_home

The home that will be created for the `hass_user`.

By default this var is set to `/home/{{ hass_user }}`.

```
hass_user_home: "/home/{{ hass_user }}"
```

License
-------

MIT

Author Information
------------------

Sofiane MEDJKOUNE
