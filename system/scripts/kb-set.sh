#!/bin/bash

args=("$@")

kb_lang=us
kb_lang_default=${kb_lang}

kb_layout_mac=mac
kb_layout_pc=pc105
kb_layout_default=${kb_layout_pc}

if [[ ${#args[@]} -eq 1 ]]; then
	kb_type=${args[0]}
	case "${kb_type}" in
		pc)
			echo "[kb-set] Applying standard PC keyboard layout..."
			localectl set-keymap ${kb_lang}
			localectl set-x11-keymap ${kb_lang} ${kb_layout_pc}
			;;
		mac)
			echo "[kb-set] Applying Apple/Mac keyboard layout..."
			localectl set-keymap ${kb_lang}
			localectl set-x11-keymap ${kb_lang} ${kb_layout_mac}
			;;
		default)
			echo "[kb-set] Applying default keyboard layout..."
			localectl set-keymap ${kb_lang_default}
			localectl set-x11-keymap ${kb_lang_default} ${kb_layout_default}
			;;
		*)
			echo "[kb-set] Unknown layout type: ${args[0]}"
			echo "Usage: $0 [pc|mac|default] or $0 [lang] [layout]"
			echo "[kb-set] Applying default keyboard layout anyway..."
			localectl set-keymap ${kb_lang_default}
			localectl set-x11-keymap ${kb_lang_default} ${kb_layout_default}
			exit 1
			;;
	esac
elif [[ ${#args[@]} -eq 2 ]]; then
	echo "[kb-set] Applying specified keyboard layout..."
	localectl set-keymap "${args[0]}"
	localectl set-x11-keymap "${args[0]}" "${args[1]}"
else
	echo "[kb-set] Unknown layout type: ${args[@]}"
	echo "Usage: $0 [pc|mac|default] or $0 [lang] [layout]"
	echo "[kb-set] Applying default keyboard layout anyway..."
	localectl set-keymap ${kb_lang_default}
	localectl set-x11-keymap ${kb_lang_default} ${kb_layout_default}
	exit 1
fi
