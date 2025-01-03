#!/bin/sh

build_status_module() {
  local index="$1"
  local icon="$2"
  local color="$3"
  local text="$4"

  if [ "$status_fill" = "icon" ]; then
    local bg
    local show_icon="#[fg=$color,bg=$thm_bg,nobold,nounderscore,noitalics]$icon "
    local show_text="#[fg=$color,bg=$thm_bg] $text"

    if [ "$status_connect_separator" = "yes" ]; then
      bg="$thm_gray"
    else
      bg="default"
    fi

    local show_left_separator="#[fg=$bg,bg=$bg,nobold,nounderscore,noitalics]$status_left_separator"
    local show_right_separator="#[fg=$thm_bg,bg=$bg,nobold,nounderscore,noitalics]$status_right_separator"
  fi

  if [ "$status_fill" = "all" ]; then
    local show_icon="#[fg=$thm_bg,bg=$color,nobold,nounderscore,noitalics]$icon "
    local show_text="#[fg=$thm_bg,bg=$color]$text"

    if [ "$status_connect_separator" = "yes" ]; then
      local show_left_separator="#[fg=$color,nobold,nounderscore,noitalics]$status_left_separator"
      local show_right_separator="#[fg=$color,bg=$color,nobold,nounderscore,noitalics]$status_right_separator"

    else
      local show_left_separator="#[fg=$color,bg=default,nobold,nounderscore,noitalics]$status_left_separator"
      local show_right_separator="#[fg=$color,bg=default,nobold,nounderscore,noitalics]$status_right_separator"
    fi

  fi

  if [ $((index)) -eq 0 ]; then
    local show_left_separator="#[fg=$bg,bg=default,nobold,nounderscore,noitalics]$status_left_separator"
  fi

  echo "$show_left_separator$show_icon$show_text$show_right_separator"
}
