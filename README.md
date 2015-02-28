Vimduino
========

Arduino IDE done right

What?
-----

This IDE enables you to develop Arduino projects using vim. I provides several simple tools like opening sketch by name, uploading, debugging.

Why?
----

Because Arduino IDE sucks. If you have ever tried it you know this fact.

Dependencies
------------

You need to have Arduino Make and original IDE. If you want to get rid of is, improve this tool and submit pull request.

Installation
------------

Just run `./configure && make && sudo make install`

Usage
-----

Run `vimduino SKETCH`. If `SKETCH` doesn't exist, it's created. You can then hit `<C-U>` to upload the code and `<C-D>` to view data from serial port (end with `<C-C>`)

Disclaimer
----------

This project is very simple. It's still much, much better than the original IDE but not perfect. If you don't like something, change it and send pull request.

Author
------

Martin Habovštiak <martin.habovstiak@gmail.com>
