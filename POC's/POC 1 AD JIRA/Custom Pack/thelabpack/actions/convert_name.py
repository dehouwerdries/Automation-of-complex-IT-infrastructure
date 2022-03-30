import sys

from st2common.runners.base_action import Action

class Action_ConvertName(Action):
    def run(self, name):
        newname = '.'.join(name.lower().split(" ", 1))
        newname = newname.replace(" ", "")

        return(True, newname)