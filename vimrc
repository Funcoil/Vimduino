setf cpp
map <C-U> :make<Enter>
map <C-D> :!stty -F "$ARDUINO_PORT" hupcl; echo -n > "$ARDUINO_PORT"; $VIMDUINO_PATH/infiniteread < "$ARDUINO_PORT"<Enter>
