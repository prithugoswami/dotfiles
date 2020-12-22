#!/usr/bin/env python3
# This bot sends any sound it receives back to where it has come from.
# WARNING! Don't put two bots in the same place!

import pymumble_py3
import time
from pymumble_py3.callbacks import PYMUMBLE_CLBK_SOUNDRECEIVED as PCS
from simple_term_menu import TerminalMenu



pwd = ""  # password
server = "omkarona.wtf"
nick = "AmongUsBot"
cert_file="/home/prithu/.local/share/amongusbot/cert.pem"
key_file="/home/prithu/.local/share/amongusbot/key.pem"


def sound_received_handler(user, soundchunk):
    # sending the received sound back to server
    mumble.sound_output.add_sound(soundchunk.pcm)


mumble = pymumble_py3.Mumble(server, nick, password=pwd, keyfile=key_file, certfile=cert_file)
mumble.start()
mumble.is_ready()

channel = mumble.channels.find_by_name('Among Us')
dead_channel = mumble.channels.find_by_name('Dead')
channel.move_in()


while True:
    s = input("> ")
    if (s == "u"):
        users = channel.get_users()
        users.remove(mumble.users.myself)
        for u in users:
            u.unmute()
    elif (s == "m"):
        users = channel.get_users()
        users.remove(mumble.users.myself)
        for u in users:
            u.mute()
    elif (s == "d"):
        user_strings = []
        users = channel.get_users()
        users.remove(mumble.users.myself)
        for u in users:
            user_strings.append(u['name'])
        if(users):
            user_selected_index = TerminalMenu(user_strings, search_key=None).show()
            if(user_selected_index):
                users[user_selected_index].unmute()
                dead_channel.move_in(session=users[user_selected_index]['session'])
    elif (s == "r"):
        for u in dead_channel.get_users():
            channel.move_in(session=u['session'])
